module.exports = function(grunt) {
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-bats');

  grunt.initConfig({
    bats: {
      files: ['test/**/*.bats']
    },
    watch: {
      bash: {
        files: ['lib/*.bash', '<%= bats.files %>'],
        tasks: 'test'
      }
    }
  });

  grunt.registerTask('test', ['bats']);
  grunt.registerTask('default', ['watch']);
};
