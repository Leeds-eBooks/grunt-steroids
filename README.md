# grunt-steroids [![NPM version](http://img.shields.io/npm/v/grunt-steroids.svg)](https://www.npmjs.org/package/grunt-steroids) [![Dependency Status](http://img.shields.io/david/AppGyver/grunt-steroids.svg)](https://david-dm.org/AppGyver/grunt-steroids)

> Steroids CLI default Grunt tasks.

## Getting Started
This plugin requires Grunt >= `0.4.4`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process and we've published this to the NPM repository, you may install this plugin with this command:

```shell
npm install grunt-steroids --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadTasks("node_modules/grunt-steroids-webpack/tasks")
```

**To use webpack + babel rather than the default Steroids build task, run steroids with the following commands instead:**

```shell
steroids connect --gruntTask=webpack
steroids deploy --gruntTask=webpack
```

Any problems or suggestions, file an issue in this package’s github issues.

## Releasing

1. Update `CHANGELOG.md`
2. Tag next npm version: `npm version <level>`
3. Publish: `npm publish`
