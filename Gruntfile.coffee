#noinspection JSUnresolvedVariable
module.exports = (grunt) ->

  grunt.loadNpmTasks task for task in [
    'grunt-contrib-coffee',
    'grunt-contrib-watch',
    'grunt-contrib-copy'
  ]

  grunt.registerTask 'default', ['coffee', 'copy']

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    watch:
      coffee:
        expand: true,
        files: 'src/**/*.coffee'
        tasks: ['coffee:compile']

    coffee:
      compile:
        expand: true,
        cwd: "#{__dirname}/src/",
        src: ['**/*.coffee'],
        dest: 'dist/',
        ext: '.js'

    copy:
      resources:
        expand: true
        cwd: 'res/'
        src: '**'
        dest: 'dist/res/'

      model:
        expand: true
        cwd: 'model/'
        src: '*.xml'
        dest: 'dist/res/nodesets'
