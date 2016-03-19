# grunt-steroids-webpack [![NPM version](http://img.shields.io/npm/v/grunt-steroids-webpack.svg)](https://www.npmjs.org/package/grunt-steroids-webpack) [![Dependency Status](https://img.shields.io/david/Leeds-eBooks/grunt-steroids/Webpack.svg)](https://david-dm.org/Leeds-eBooks/grunt-steroids/Webpack)

> Steroids CLI Grunt tasks with (optionally) Babel, Webpack and Jade.

## Getting Started
This plugin requires Grunt >= `0.4.4`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-steroids-webpack --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks("grunt-steroids-webpack")
```

**To use webpack + babel + jade (optional) rather than the default Steroids build task, add the following to your project's `Gruntfile.js`:**

```js
grunt.registerTask("webpack", [
  "steroids-make-fresh-webpack"
])
```

**and run steroids with the following commands instead:**

```shell
steroids connect --gruntTask=webpack
steroids deploy --gruntTask=webpack
```

**You also need a `webpack.config.js` in your project root that exports a config object, see [here](http://webpack.github.io/docs/configuration.html#cli) for details.**

Any Jade views will be converted to HTML (it is completely fine to have no Jade at all or a mixture of Jade views and HTML views).

Any problems or suggestions, file an issue in this package’s github issues.
