path          = require 'path'
webpackConfig = require path.join process.cwd(), 'webpack.config.js'

module.exports = (grunt)->

  grunt.loadNpmTasks "grunt-extend-config"
  grunt.loadNpmTasks "grunt-webpack"
  grunt.loadTasks "#{__dirname}/scripts"

  grunt.extendConfig
    clean:
      tmp: ["dist/tmp"]
    webpack:
      build: webpackConfig

  grunt.registerTask(
    "steroids-module-compile-scripts"
    "Compile JS from app/*.coffee to dist/tmp/*.js"
    ['webpack:build']
  )
