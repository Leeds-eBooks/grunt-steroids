path = require 'path'
CommonsChunkPlugin = require 'webpack/lib/optimize/CommonsChunkPlugin'

module.exports = (grunt)->

  grunt.loadNpmTasks "grunt-extend-config"
  grunt.loadNpmTasks "grunt-webpack"
  grunt.loadTasks "#{__dirname}/scripts"

  modulesPath = path.resolve 'app'

  grunt.extendConfig
    clean:
      tmp: ["dist/tmp"]
    webpack:
      build:
        entry: grunt.file.expand({cwd: modulesPath}, '*').reduce(
          (entryObj, module) ->
            pathArr = [modulesPath, module, 'index.js']
            if module isnt 'common' and grunt.file.exists pathArr...
              entryObj[path.basename(module)] = path.join pathArr...
            entryObj
          {}
        )
        output:
          path: 'dist/app'
          filename: '[name].js'
        module:
          loaders: [
            {
              test: /\.js$/
              exclude: /(node_modules\/^a|bower_components)/
              # include: /node_modules\/@/
              loader: 'babel'
            }
          ]
        plugins: [
          new CommonsChunkPlugin path.join('common.js')
        ]

  grunt.registerTask(
    "steroids-module-compile-scripts"
    "Compile JS from app/*.coffee to dist/tmp/*.js"
    [
      # "steroids-module-compile-babel"
      # "steroids-module-compile-coffeescript"
      # "steroids-module-copy-javascript"
      # "steroids-module-concat-javascript"
      # "clean:tmp"
      'webpack:build'
    ]
  )
