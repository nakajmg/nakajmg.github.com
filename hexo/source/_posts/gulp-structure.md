title: gulpのアプローチ "なぜグローバルとローカルにインストールが必要なのか"
date: 2014-9-3 1:00
categories: [tech]
tags: ['gulp', 'node']
---

![gulp srtucture](/img/photo/2014-09-03.png)

[gulpのGetting Started](https://github.com/gulpjs/gulp/blob/master/docs/getting-started.md)にもあるように、gulpを使うにはグローバルインストールとローカルインストールが必要になる。なんで同じものを2つインストールするのか、不思議に思ってソース読んで「へー」と思ったのでまとめてみる。

<!-- more -->

## Gruntの場合

Gruntの場合は`grunt-cli`をグローバルにインストールして`grunt`はローカルにインストールする。`grunt-cli`はローカルにインストールした`grunt`を呼び出すためだけのモジュールだ。タスクを走らす`grunt`と、その`grunt`を実行する`grunt-cli`、2つのモジュールは明確に役割が切り離されている。

Gruntがこうなってる理由は、異なるプロジェクトで使ってる`grunt`のバージョンが違うと、グローバルにインストールされてる`grunt`のバージョン次第で、そのタスク（Gruntfile）が動かせない可能性が出てくるから。

（参考: [Grunt v0.4.0 での変更点 | Takazudolog](http://takazudo.github.io/blog/entry/2013-02-23-grunt04.html)）

## gulpの場合

gulpもGruntと同じで、グローバルにインストールされた`gulp`はローカルにインストールされた`gulp`を実行するためにインストールする。でもこのグローバルとローカルの2つのモジュールの中身は完全に同じもので、まったく同じモジュールをグローバルとローカルにインストールすることになる。ここにGruntとのアプローチの違いがある

### gulpのアプローチ

gulpのソースを見ると次のようなコードがある。

```javascript
...
var gulpInst = require(env.modulePath);
...
```

`env`には実行しているディテクトリのパスや`gulpfile`のパスなどが入っている。`env.modulePath`にはローカルの`node_modules`にある`gulp`のパスが入っている。`gulp`コマンドが実行されると、この`require`でローカルの`gulp`をインポートして、実際の処理（`gulpfile`に書かれたタスク）は`require`されたローカルの`gulp`モジュールが全て行う。自分自身が自分自身と同じモジュールを`require`して使うという仕組みだ（厳密には同じじゃないけどまぁ同じということで）。おもしろい！

### ローカルにgulpがインストールされてない場合

ローカルに`gulp`がインストールされてない場合には次のようなチェックではじいている。

```javascript
...
if (!env.modulePath) {
  gutil.log(
    chalk.red('Local gulp not found in'),
    chalk.magenta(tildify(env.cwd))
  );
  gutil.log(chalk.red('Try running: npm install gulp'));
  process.exit(1);
}
...
```

ローカルに`gulp`がインストールされてない場合は`env.modulePath`は`undefined`になる。ここではじくことで処理が終わる。


## まとめ

Gruntは`gunrt-cli`と`grunt`を別のモジュールにして役割を分けた。
gulpは同じ`gulp`の中で別の`gulp`をモジュールとして`require`するというアプローチを取っている。グローバルとローカル、同じモジュールに2つの役割を持たせて、プロジェクトごとの`gulp`のバージョンの違いを吸収している。個人的にはgulpのアプローチのほうがカッコイイと思う。スマートだ。


今回gulpのソースを読んでみて、gulpというかNode.jsがおもしろいと思った。

---

### おまけ

gulpは最近何かと話題のsemverのチェックもしている。

```javascript
...
// check for semver difference between cli and local installation
if (semver.gt(cliPackage.version, env.modulePackage.version)) {
  gutil.log(chalk.red('Warning: gulp version mismatch:'));
  gutil.log(chalk.red('Global gulp is', cliPackage.version));
  gutil.log(chalk.red('Local gulp is', env.modulePackage.version));
}
...
```

グローバルとローカルのバージョンがsemver的に合ってない場合は警告を出してくる。もうすぐ`4.x`系が出てくるだろうから、このメッセージを見れる日は近い。
