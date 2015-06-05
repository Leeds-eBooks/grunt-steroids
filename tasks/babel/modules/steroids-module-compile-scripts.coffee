
module.exports = (grunt)->

  grunt.loadNpmTasks "grunt-extend-config"
  grunt.loadTasks "#{__dirname}/scripts"

  grunt.extendConfig
    clean:
      tmp: ["dist/tmp"]

  grunt.registerTask "steroids-module-compile-scripts", "Compile CoffeeScript from app/*.coffee to dist/tmp/*.js", [
    "steroids-module-compile-babel"
    "steroids-module-compile-coffeescript"
    "steroids-module-copy-javascript"
    "steroids-module-concat-javascript"
    "clean:tmp"
  ]

  # grunt.registerTask "steroids-module-compile-scripts", "Compile CoffeeScript from app/*.coffee to dist/tmp/*.js", ->
  #   grunt.task.run "steroids-module-compile-babel"
  #   grunt.task.run "steroids-module-compile-coffeescript"
  #   # grunt.task.run "steroids-module-copy-javascript"
  #   grunt.task.run "steroids-module-concat-javascript"
  #   grunt.task.run "clean:tmp"
