module.exports = function( grunt )
{
  grunt.initConfig(
    {
      pkg : grunt.file.readJSON('package.json'),

      //jshint js validator
      jshint : {
        options : {
          curly : true,
          eqeqeq : true,
          eqnull : true,
          globals : {
            "jQuery" : true
          }
        },
        uses_defaults : ['dev/js/main.js'],

      },

      //stylus
      stylus :{
        production: {
          files : {
            'dev/css/stylus.css' : ['dev/stylus/*.styl']
          }
        }
      },

      //less
      recess : {
        production: {
          options : {
            compile : true,
          },
          files : {
            'dev/css/less.css' : ['dev/less/*.less']
          }
        }
      },

      //cssmin
      cssmin : {
        options : {
          keepspecialcomments : 0 ,
          report : 'min'
        },
        compress : {
          files : {
            'master/css/main.css' : ['dev/css/less.css', 'dev/css/stylus.css']
          }
        },
      },

      //copy
      copy : {
        font : {
          files : [
            { expand : true,cwd: 'dev/font/', src : '*.*', dest:'master/font/' }
          ]
        },
        images : {
          files : [
            { expand : true,cwd: 'dev/images/', src : '*.*', dest:'master/images/' }
          ]
        },
        html : {
          files : [
            { expand : true, cwd : 'dev/', src: '*.html', dest : 'master/' }
          ]
        },
        js : {
          files : [
            { expand : true, cwd : 'dev/js/', src : '*.js', dest : 'master/js/'}
          ]
        },
        jsVendor : {
          files : [
            { expand : true, cwd : 'dev/js/vendor', src : '*.js', dest : 'master/js/vendor'}
          ]
        },
        bbCollection : {
          files : [
            { expand : true, cwd : 'dev/js/collection', src : '*.js', dest : 'master/js/collection'}
          ]
        },
        bbModel : {
          files : [
            { expand : true, cwd : 'dev/js/model', src : '*.js', dest : 'master/js/model'}
          ]
        },
        bbView : {
          files : [
            { expand : true, cwd : 'dev/js/view', src : '*.js', dest : 'master/js/view'}
          ]
        },
        Crafty : {
          files : [
            { expand : true, cwd : 'dev/js/crafty', src : '*.js', dest : 'master/js/crafty'}
          ]
        },

      },

      //concat (test)
      concat : {
        options : {
          separator : ';'
        },
        dist : {
          src : ['dev/js/vendor/zepto.min.js'],
          dest : 'dev/js/lib.js'
        }
      },

    });

    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-recess');
    grunt.loadNpmTasks('grunt-contrib-stylus');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-contrib-concat');

    grunt.registerTask('default',['stylus', 'recess:production', 'jshint','cssmin', 'copy']);

}
;
