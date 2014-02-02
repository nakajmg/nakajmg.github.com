module.exports = function(grunt) {
  grunt.initConfig({
    copy: {
        publish: {
            files: [
              { src: ['js/**','css/**','blog/**/*.html','img/**','*.html'], dest: '../', cwd: '_site/', expand: true }
            ]
        },
        dev: {
          files: [
              { src: ['css/**'],dest: './_site/' },
              { src: ['js/**'],dest: './_site/' }
            ]
        },
    },
    growl: {
        compass: {
          message: 'compass compile',
          title: 'compass'
        },
        reload: {
          message: 'filechange',
          title: 'livereload'
        },
        publish: {
          message: 'publish finish',
          title: 'grunt publish'
        }
    },
    compass: {
        dist: {
            options: {
                config: 'config.rb',
                environment: 'development'
            }
        },
        prod: {
            options: {
                config: 'config.rb',
                environment: 'production'
            }
        }
    },
    connect: {
      server: {
        options: {
          port: 8080,
          base: './_site/',
          open: 'http://localhost:8080/'
        }
      }
    },
    // shell: {
    //   jekyll: {
    //     command: 'jekyll serve --watch &'
    //   }
    // },
    jekyll: {
      publish: {
        options: {
          server: false
        }
      }
    },
    csso: {
      publish: {
        files: {
          './css/style.min.css': ['./css/style.css']
        }
      }
    },
    watch: {
        dist: {
            files: ['sass/*.scss'],
            tasks: ['compass:dist'],
            options: {
                livereload: false
            }
        },
        // jekyllFile: {
        //     files: ['_site/blog/**','_site/css/**','_site/js/**','_site/*.html','_site/img/**'],
        //     // tasks: [''],
        //     options: {
        //       livereload: true
        //     }
        // }
        copy_dev: {
            files: ['css/*.css'],
            tasks: ['copy:dev','growl:reload'],
            options: {
              livereload: true
            }
        }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-compass');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-csso');
  grunt.loadNpmTasks('grunt-shell');
  grunt.loadNpmTasks('grunt-growl');
  grunt.loadNpmTasks('grunt-jekyll');


  grunt.registerTask('default',['connect','watch']);
  grunt.registerTask('develop',['csso']);
  grunt.registerTask('publish',['csso','jekyll','copy:publish','growl:publish']);

};