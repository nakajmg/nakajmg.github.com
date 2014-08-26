gulp = require("gulp")
$ = require("gulp-load-plugins")()
del = require("del")
runSequence = require("run-sequence")
browserSync = require("browser-sync")
reload = browserSync.reload
spawn = require("child_process").spawn
exec = require("child_process").exec
gutil = require("gulp-util")


# gulp.task "hexo:proxy", ->
#   browserSync proxy: "localhost:4000"
gulp.task "hexo:server", (cb) ->
  init = false
  hexo = spawn("hexo", ["server"])
  hexo.stdout.on "data", (data) ->
    if !init
      browserSync 
        proxy: "localhost:4000"
        notify: false
      init = true
    console.log "Hexo:#{data.toString('utf8')}"
    setTimeout reload, 500
  hexo.stderr.on "data", (data) ->
    console.log "Hexo:#{data.toString('utf8')}"
    setTimeout reload, 500

gulp.task "hexo", [
  "hexo:server"
]

gulp.task "serve:dist", [
  "clean"
  "hexo:generate"
], ->
  browserSync
    notify: false
    server:
      baseDir: ["public"]


gulp.task "clean", del.bind(null, ["public"])

gulp.task "hexo:generate", ->
  spawn("hexo", ["generate"])
  
gulp.task "copy", ->
  gulp.src(["public/**/*"]).pipe gulp.dest("../")

gulp.task "publish", ->
  runSequence "clean", "hexo:generate", ["copy"]


gulp.task "atom", $.shell.task(["atom"])

gulp.task "default", [
  "hexo"
  "atom"
]
