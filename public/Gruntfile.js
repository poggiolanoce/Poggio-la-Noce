module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    coffee: {
      glob_to_multiple: {
        expand: true,
        flatten: true,
        cwd: 'coffeescript/',
        src: ['**/*.coffee'],
        dest: 'javascript/',
        ext: '.js'
      }
    },
    sass: {
      dist: {
        options: {
          style: 'expanded',
          sourcemap: 'none'
        },
        files: [{
          expand: true,
          cwd: 'css/sass',
          src: ['*.sass'],
          dest: 'css',
          ext: '.css'
        }]
      }
    },
    autoprefixer:{
      no_dest_multiple: {
        src: 'css/*.css'
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
        files: ['coffeescript/**/*.coffee','coffeescript/**/*.js'],
        tasks: ['coffee','uglify'],
        options: {
          spawn: false,
        },
      },
      css: {
        files: 'css/sass/*.sass',
        tasks: ['sass'],
        options: {
          livereload: true,
        },
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-autoprefixer');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-uglify');

  grunt.registerTask('default', ['coffee','sass','autoprefixer','uglify','watch']);
};
