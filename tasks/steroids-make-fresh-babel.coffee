module.exports = (grunt) ->
  grunt.registerTask "steroids-make-fresh-babel", "Create the dist/ folder that is copied to the device, using babel on all js files.", ->
    grunt.loadTasks("#{__dirname}/fresh/babel")
    grunt.task.run [
      "steroids-check-project"
      "steroids-clean-dist"
      "steroids-copy-www"
      "steroids-compile-coffee"
      "steroids-compile-es6"
      "steroids-copy-components"
      "steroids-configure"
      "steroids-compile-modules"
      "steroids-compile-sass"
      "steroids-copy-css"
      "steroids-setup-cloud-resources"
      "steroids-setup-features"
    ]
