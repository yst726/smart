module.exports = (grunt) ->
    'use strict'
    require('load-grunt-tasks')(grunt)
    path = require('path');
    webpack = require('webpack');
    projectRoot = path.resolve(__dirname, '../');
    PORT = 9008;

    grunt.initConfig {
        pkg: grunt.file.readJSON 'package.json'
        execute: {
            target: {
                src: ['server.js']
            }
        }
        clean: {
            all: {
                src: ["build/**/*"]
            }
        }
        sass: {
            dist: {
                options: {
                    sourcemap: 'auto'
                    trace: true
                    quiet: false
                    debugInfo: true
                    lineNumbers: true
                    update: true
                    style: 'compressed'
                }
                files: [{
                    expand: true,
                    cwd: 'src/styles/'
                    src: 'index.scss'
                    dest: 'build/styles/'
                    ext: '.css'
                }]
            }
        }
        watch: {
            less: {
                files: 'src/styles/**/*.scss'
                tasks: ['sass']
            }
        }
    }

    # 浏览器开发
    grunt.registerTask 'default', ['clean', 'sass', 'execute']
    return