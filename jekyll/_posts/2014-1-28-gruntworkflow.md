---
layout: post
title:  "Gruntダイエットで健やかな開発を"
date:   2014-1-28 6:00
categories: 雑記 Grunt
---

![/img/photo/2014-1-28.jpg](/img/photo/2014-1-28.jpg)

Gruntタスクでダイエットする話ではないです。

[Gruntfile.jsを10行にした話@watilde on Qiita](http://qiita.com/watilde/items/278ce0593339072d5627)

このエントリを見てGruntfileのダイエットをしてみた。

## 激ヤセGruntfile

<script src="https://gist.github.com/nakajmg/8655997.js?file=Gruntfile.js"></script>

コメントを消せば9行。スッキリ！


## config.jsでタスクの管理

<script src="https://gist.github.com/nakajmg/8655997.js?file=config.js"></script>

使うタスクは`connect: require("./connect")`な感じで指定。`require`で指定するのは`grunt.initConfig`に記述していた内容が書いてあるファイル。
パスは`config.js`から見た相対パスで指定。

### package.json

package.jsonは普通。

<script src="https://gist.github.com/nakajmg/8655997.js?file=package.json"></script>

## 各タスクの中身

タスクファイルの中身はこんな感じ。

<script src="https://gist.github.com/nakajmg/8655997.js?file=connect.js"></script>
<script src="https://gist.github.com/nakajmg/8655997.js?file=sass.js"></script>
<script src="https://gist.github.com/nakajmg/8655997.js?file=autoprefixer.js"></script>
<script src="https://gist.github.com/nakajmg/8655997.js?file=watch.js"></script>

これらのファイルを`config.js`で指定して使う。なんのタスクなのかファイルの先頭にコメントで入れておくと良い気がするので入れてる。

かなり管理しやすい。再利用も容易。


## 良い

普通に`Gruntfile`に全部記述するやり方のときはプロジェクト毎に合わせたタスクを毎回書いてた。
コピペで使うにしてもちょっと手間がかかる。

このやり方だと自分用のテンプレを容易して

* コピーして`config.js`で使いたいタスクを指定
* 各タスクを編集(パスの書き換えとか)

するだけで済む。一度書いたタスクの再利用性が抜群に上がった。高まる。


## 自分用Gruntのスケルトンを作ろう

GruntのスケルトンをGitHubに作った。

[nakajmg/GruntTemplate](https://github.com/nakajmg/GruntTemplate)

ターミナルでこんな感じで使えばすぐに作業に入れる。

```
git clone git@github.com:nakajmg/GruntTemplate destfoldername
rm -rf destfoldername/.git
cd destfoldername
npm install
```

bashの関数に登録して全部コマンド一発でやってくれるようにした。

```
myGrunt(){
  if [ $# -ne 1 ]; then
    echo "usage:myGrunt need destfoldername"
  else
    command git clone git@github.com:nakajmg/GruntTemplate $1
    command rm -rf $1/.git
    command cd $1
    command npm install
  fi
}
```

これで`myGrunt`に引数でフォルダ名指定すれば`npm install`まで勝手にやってくれる。楽。

---

「このタスクどう書くんだっけなー。前に書いたGruntfileどこにあったかなー」的な時間がなくなるので大変良いと思う。


また一歩、牛さんと仲良くなれた気がする( ˘ω˘ )