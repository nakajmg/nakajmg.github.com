title: gulp-plumberとgulp-notifyでデスクトップ通知を出す
date: 2014-8-13 8:00
categories: [tech]
tags: ['gulp']
---

![gulp-plumber & gulp-notify](/img/photo/2014-08-13.png)

gulpでwatch中にエラーが出たとき、ターミナルでエラーメッセージが出ててもなかなか気づけないので通知を出すようにした。

<!-- more -->

`gulpfile`の記述とか詳細はQiitaに投稿したのでこちらを参照。

* [gulpタスク実行中にエラーが出たらデスクトップ通知を出す | Qiita](http://qiita.com/nakajmg/items/8add9c58ea28a8f31eed)

![notify](/img/photo/2014-08-13_2.gif)

## 通知出すやつ

今回`gulp-notify`と`node-notifier`の2つを使ってみた。`gulp-notify`は`gulp-plumber`と組み合わせるにはベストな感じで何も考えず設定できる。

[node-notifier](https://www.npmjs.org/package/node-notifier)は[terminal-notifier](https://github.com/alloy/terminal-notifier)を使ってて細かい指定ができる。めんどくさくないなら`node-notifier`でタスク毎に通知をカスタマイズするとヨサソウ。

## イベント監視する

Qiitaの方には書かなかったけど、gulpのプラグインはだいたいエラーが起きたときには`this.emit('error', error)`みたいな感じで`error`イベントを発行してくれてる。どんなイベントを発行してるかは`node_modules`の中にあるプラグインのソースを直接読むのが早い。

イベントのハンドリングは下記みたいな感じでハンドリングできる。(errorイベントに限らず)

```
var gulp = require('gulp');
var plumber = require('gulp-plumber');
var coffee = require('gulp-coffee');
var Notifier = require('node-notifier');
var notifier = new Notifier();

gulp.task('coffee', function() {
  return gulp.src('src/coffee/**/*.coffee')
    .pipe(plumber()
    .pipe(coffee().on('error', function(err) {
      notifier.notify({
        message: error.message,
        title: 'coffee compile error',
        sound: 'Glass'
      });
    }))
  .pipe(gulp.dest('app/assets/js');
});
```

10行目に`coffee`のコンパイルを実行してて、そこで`.on`で`error`イベントが起こったときのハンドラを指定してる。こんな感じでイベントが起こったときの振る舞いを指定する。

「このイベント欲しいのにな〜」と思ったらプラグインのソースのぞいて`.emit('hoge', hoge)`みたいなの足すのも手です。(環境変わると同じコード足さないと使えなくなるけど)

環境、どんどん自分に最適化していきましょう。
