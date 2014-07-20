var gulp = require('gulp');
var $ = require('gulp-load-plugins')();
var del = require('del');
var runSequence = require('run-sequence');
var browserSync = require('browser-sync');
var reload = browserSync.reload;
// var shell = require('gulp-shell'),


gulp.task('clean', del.bind(null, ['public, ../dist']));

gulp.task('default', ['clean'], function(cb) {
  console.log('clean')
});


gulp.task('generate', $.shell.task(['hexo generate']))
gulp.task('copy', function() {
  return gulp.src(['public/*'])
    .pipe(gulp.dest('../dist'));
});

gulp.task('publish', function() {
  runSequence('clean', 'generate',['copy']);
});
