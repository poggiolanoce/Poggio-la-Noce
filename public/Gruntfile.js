module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    coffee: {
      compile: {
        files: {
          'javascript/main.js': 'coffeescript/main.coffee'
        }
      }
    },
    compass: {
      dist: {
        options: {
          sassDir: 'css/sass',
          cssDir: 'css',
          httpPath: '',
          imagesPath: 'images',
        }
      }
    },
    uglify: {
      my_task: {
        src : ['coffeescript/jquery.js','coffeescript/js-extras/*.js'],
        dest : 'javascript/plugins.js'
      }
    },
    watch: {
      scripts: {
        files: ['coffeescript/*.coffee','coffeescript/*.js'],
        tasks: ['coffee','uglify'],
        options: {
          spawn: false,
        },
      },
      css: {
        files: 'css/sass/*.sass',
        tasks: ['compass'],
        options: {
          livereload: true,
        },
      }
    }
  });
  
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-compass');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-uglify');

  grunt.registerTask('default', ['coffee','compass','uglify','watch']);
};