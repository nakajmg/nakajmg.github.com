var gulp = require('gulp');
var $ = require('gulp-load-plugins')();
var del = require('del');
var runSequence = require('run-sequence');
var browserSync = require('browser-sync');
var reload = browserSync.reload;


gulp.task('clean', del.bind(null, ['public']));

gulp.task('hexo-reload', function() {
  browserSync({
    proxy: 'localhost:4000'
  });
  
  gulp.watch(['source/_posts/*.md', 'theme/**/*.ejs', 'theme/**/*.styl'], function(e) {
    gulp.src(e.path)
    .pipe($.wait(1000))
    .pipe(reload({stream: true}));
  });
});

// Optimize Images
gulp.task('images', function () {
  return gulp.src('public/img/**/*')
    .pipe($.cache($.imagemin({
      progressive: true,
      interlaced: true
    })))
    .pipe(gulp.dest('../img'))
});

gulp.task('hexo-server', $.shell.task(['hexo server']));
gulp.task('hexo-generate', $.shell.task(['hexo generate']));

gulp.task('copy', function() {
  return gulp.src(['public/**/*'])
    .pipe(gulp.dest('../'));
});

gulp.task('serve:dist', ['clean', 'hexo-generate'], function() {
  browserSync({
    notify: false,
    server: {
      baseDir: ['public']
    }
  });
});

gulp.task('publish', function() {
  runSequence('clean', 'hexo-generate',['copy'], 'images');
});

gulp.task('atom', $.shell.task(['atom']));

gulp.task('default', ['hexo-reload', 'atom']);
