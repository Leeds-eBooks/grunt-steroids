
module.exports = (grunt)->

  # grunt.loadNpmTasks "grunt-extend-config"
  grunt.loadNpmTasks "grunt-babel"

  grunt.extendConfig {
    babel:
      modules:
        expand: true
        cwd: 'app/'
        src: '**/*.js'
        dest: 'dist/tmp/'
        ext: '.js'
  }

  grunt.registerTask "steroids-module-compile-coffeescript", "Compile CoffeeScript from app/*.coffee to dist/tmp/*.js", ->
    grunt.task.run "coffee:modules"
