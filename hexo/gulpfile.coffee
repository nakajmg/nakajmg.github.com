gulp = require("gulp")
$ = require("gulp-load-plugins")()
del = require("del")
runSequence = require("run-sequence")
browserSync = require("browser-sync")
reload = browserSync.reload
childp = require("child_process").exec

gulp.task "clean", del.bind(null, ["public"])
gulp.task "hexo:reload", ->
  browserSync proxy: "localhost:4000"
  gulp.watch [
    "source/_posts/*.md"
    "theme/**/*.ejs"
    "theme/**/*.styl"
  ], (e) ->
    gulp.src(e.path).pipe($.wait(1000)).pipe reload(stream: true)


gulp.task "hexo:generate", $.shell.task(["hexo generate"])
gulp.task "copy", ->
  gulp.src(["public/**/*"]).pipe gulp.dest("../")

gulp.task "hexo:server", (cb) ->
  childp "hexo server", (err) ->
    return cb?(err) if err
    cb?()

gulp.task "serve:dist", [
  "clean"
  "hexo:generate"
], ->
  browserSync
    notify: false
    server:
      baseDir: ["public"]


gulp.task "publish", ->
  runSequence "clean", "hexo:generate", ["copy"]


gulp.task "atom", $.shell.task(["atom"])
gulp.task "default", [
  "hexo:server"
  "hexo:reload"
  "atom"
]
