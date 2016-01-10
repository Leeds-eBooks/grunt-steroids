fs   = require 'fs'
jade = require 'jade'
path = require 'path'

module.exports = (grunt)->
  parseJadeOrReadHTML = (filepath) ->
    if path.extname(filepath) == '.jade'
      jade.renderFile filepath
    else
      grunt.file.read filepath

  snippets = {}
  addToObj = (obj, key, value) -> obj[key] = value

  for snippetPath in grunt.file.expand ['app/**/snippets/**/*.html']
    addToObj(
      snippets
      snippetPath.substring(
        snippetPath.lastIndexOf('/') + 1
        snippetPath.lastIndexOf '.'
      )
      parseJadeOrReadHTML snippetPath
    )

  grunt.loadNpmTasks "grunt-extend-config"

  grunt.extendConfig {
    "steroids-module-compile-views":
      app:
        expand: true
        cwd: 'app'
        src: [
          '*/views/**/*.{html,jade}'
          '!**/layout.*'
          '!**/*.android.{html,jade}'
          '!**/snippets/**/*.{html,jade}'
        ]
        dest: 'dist/app/'
  }

  firstExistingFile = (files) ->
    for file in files
      if fs.existsSync file
        return file

  # Files starting with _ are used as view fragments and are not standalone views
  isFragment = (filename) ->
    (filename.indexOf '_') is 0

  # List of modules that this module depends on - used for including JS files
  discoverModuleDependencies = (moduleName) ->
    switch moduleName
      when 'common' then ['common']
      else ['common', moduleName]

  extractContextFromFilepath = (filepath) ->
    [
      whole
      module
      view
    ] = filepath.match /app\/([^\/]*)\/views\/([^.]*)/

    {
      view
      module
      modules: discoverModuleDependencies module
    }

  toAndroidFilepath = (filepath) -> filepath.replace /(\.android)?\.html$/, '.android.html'

  renderWithLayout = (layoutPath, content, context) ->
    grunt.util._.template(parseJadeOrReadHTML layoutPath) {
      yield:
        view: content
        viewName: context.view
        moduleName: context.module
        modules: context.modules
        snippets: snippets
    }

  determineDestinationLayoutAndSource = (destination, source, layoutPaths) ->
    destinations = {}

    # Plain version
    destinations[destination] =
      sourcePath: source
      layoutPath: firstExistingFile layoutPaths

    # Android version
    androidSource = toAndroidFilepath source
    androidLayoutPath = firstExistingFile layoutPaths.map toAndroidFilepath
    hasAndroidSource = fs.existsSync androidSource
    hasAndroidLayout = !!androidLayoutPath
    if hasAndroidSource or hasAndroidLayout
      destinations[toAndroidFilepath destination] =
        sourcePath: if hasAndroidSource then androidSource else source
        layoutPath: if hasAndroidLayout then androidLayoutPath else destinations[destination].layoutPath

    destinations

  maybeRenderWithLayouts = (source, destination, context, layoutPaths) ->
    for destinationPath, {sourcePath, layoutPath} of determineDestinationLayoutAndSource(destination, source, layoutPaths)
      content = grunt.util._.template(parseJadeOrReadHTML sourcePath) {
        yield:
          snippets: snippets
      }

      if layoutPath?
        grunt.file.write destinationPath, (renderWithLayout layoutPath, content, context)
      else
        grunt.file.write destinationPath, content

  grunt.registerMultiTask "steroids-module-compile-views", "Compile views from app/*/views/ to dist/*", ->
    layouts = {}

    @files.forEach (file) ->
      destination = file.dest.replace(/views\//, '').replace('.jade', '.html')
      context = extractContextFromFilepath file.dest

      for source in file.src
        # Skip layouting if it's a _fragment
        if isFragment context.view
          grunt.file.copy source, destination
        else
          maybeRenderWithLayouts source, destination, context, [
            "app/#{context.module}/views/layout.html"
            "app/#{context.module}/views/layout.jade"
            "app/common/views/layout.html"
            "app/common/views/layout.jade"
          ]
