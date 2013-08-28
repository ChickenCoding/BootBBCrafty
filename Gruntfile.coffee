module.exports= (grunt) ->

  "use strict"

  grunt.initConfig

    pkg : grunt.file.readJSON('package.json')

    requirejs :
      build :
        options :
          #mainConfigFile : "dev/js/config.js"
          baseUrl : "master/js"
          name : "app"
          out : "master/js/build.js"
          optimize : "none"


    jshint :
      options :
        curly : true
        eqeqeq : true
        eqnull : true
        globals :
          "JQuery" : true
      uses_default : ["dev/js/main.js"]

    coffee :
      compile :
        files : [
          expand : true
          filter : "isFile"
          dest : "dev/js"
          cwd : "dev/coffee"
          src : ["**/*"]
          ext : ".js"
        ]

    stylus :
      production :
        files :
          "dev/css/stylus.css" : ["dev/stylus/*.styl"]

    recess :
      production :
        options :
          compile : true
        files :
          "dev/css/less.css" : ["dev/less/*.less"]

    cssmin :
      options :
        keepspecialcomments : 0
        report : "min"
      compress :
        files :
          "master/css/main.css" : ["dev/css/less.css", "dev/css/stylus.css"]

    copy :
      font :
        files :
          [
              expand : true
              cwd : "dev/font/"
              src : "*.*"
              dest : "master/font/"
          ]
      images :
        files :
          [
            expand : true
            cwd : "dev/images/"
            src : "*.*"
            dest : "master/images"
          ]
      js :
        files :
          [
            filter : "isFile"
            expand : true
            cwd : "dev/js"
            src : ["**"]
            dest : "master/js"
          ]
      html :
        files :
          [
            filter : "isFile"
            expand : true
            cwd : "dev/html"
            src : ["**"]
            dest : "master"
          ]


    concat :
      options :
        separator : ";"
      dist :
        src : ['dev/js/vendor/*.js']
        dest : "master/js/lib.js"

    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.loadNpmTasks 'grunt-contrib-less'
    grunt.loadNpmTasks 'grunt-recess'
    grunt.loadNpmTasks 'grunt-contrib-stylus'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-cssmin'
    grunt.loadNpmTasks 'grunt-contrib-jshint'
    grunt.loadNpmTasks 'grunt-contrib-concat'
    grunt.loadNpmTasks 'grunt-contrib-requirejs'

    grunt.registerTask 'default',[
        'stylus'
        'recess:production'
        'coffee'
        'jshint'
        'cssmin'
        'copy'
        'requirejs'

  ]



