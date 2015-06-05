# For SPA
module.exports = (grunt)->

  grunt.loadNpmTasks "grunt-babel"
  # grunt.loadNpmTasks "grunt-extend-config"

  grunt.registerTask "steroids-compile-babel", "Compile es6 files from  www/ to dist/ (for SPA)", ->

    grunt.initConfig
      babel:
        compile_www:
          expand: true
          cwd: "www/"
          src: ["**/*.js"]
          dest: "dist/"
          ext: ".js"

    grunt.task.run "coffee:compile_www"
