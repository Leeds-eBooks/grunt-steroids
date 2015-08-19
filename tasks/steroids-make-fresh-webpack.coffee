module.exports = (grunt) ->
  grunt.registerTask(
    "steroids-make-fresh-webpack"
    "Create the dist/ folder, using babel + webpack on all js files."
    ->
      grunt.loadTasks("#{__dirname}/webpack")
      grunt.task.run [
        "steroids-check-project"
        "steroids-clean-dist"
        "steroids-copy-www"
        "steroids-compile-coffee"
        "steroids-compile-babel"
        "steroids-copy-components"
        "steroids-configure"
        "steroids-compile-modules"
        "steroids-compile-sass"
        "steroids-copy-css"
        "steroids-setup-cloud-resources"
        "steroids-setup-features"
      ]
  )
