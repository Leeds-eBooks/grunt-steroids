
module.exports = (grunt)->

  grunt.loadNpmTasks "grunt-extend-config"
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

  grunt.registerTask "steroids-module-compile-babel", "Compile es6 files from app/*.js to dist/tmp/*.js", ->
    grunt.task.run "babel:modules"
