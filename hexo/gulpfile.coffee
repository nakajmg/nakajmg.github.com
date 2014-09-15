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

gulp.task "serve:dist", ->
  browserSync
    notify: false
    server:
      baseDir: ["public"]


gulp.task "clean", del.bind(null, ["public"])

gulp.task "hexo:generate", (cb)->
  exec("hexo generate", (err, stdout, stderr)->
    console.log stdout
    console.log stderr
    cb(err)
  )
  
gulp.task "copy", ->
  gulp.src(["./public/**/*"])
    .pipe gulp.dest("../")

gulp.task "publish", ->
  runSequence "clean", "hexo:generate", "copy"

gulp.task "atom", (cb)->
  exec("atom", (err, stdout, stderr)->
    console.log stdout
    console.log stderr
    cb(err)
  )

gulp.task('reset', ->
  reportOptions =
    err: true
    stderr: true
    stdout: true
      
  gulp.src(['./**/**', '!./node_modules'])
    .pipe($.using())
    .pipe($.exec('git checkout <%= file.path %>', continueOnError: true ))
    .pipe($.exec.reporter(reportOptions))
)

gulp.task "default", [
  "hexo"
  "atom"
]
