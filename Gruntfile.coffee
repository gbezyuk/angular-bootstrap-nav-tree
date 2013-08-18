
module.exports = (grunt)->  

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    jade:
      dev:
        options:
          pretty:true
        files:
          'dist/abn_tree_template.html':'src/abn_tree_template.jade'
          'test/test_abn_tree.html':'src/test_abn_tree.jade'
    
    less:
      dev:
        options:
          compress:false
        files:
          'dist/abn_tree_style.css':'src/abn_tree_style.less'


    coffee:
      dev:
        options:
          bare:true
        files:
          'dist/abn_tree_directive.js':'src/abn_tree_directive.coffee'
          'test/test_abn_tree.js':'src/test_abn_tree.coffee'


    watch:
      jade:
        files:['**/*.jade']
        tasks:['jade']
        options:
          livereload:true
      less:
        files:['**/*.less']
        tasks:['less']
        options:
          livereload:true

      coffee:
        files:['**/*.coffee']
        tasks:['coffee']
        options:
          livereload:true

  grunt.loadNpmTasks 'jade'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['jade','less','coffee']

