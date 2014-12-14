title: MacのChromeで表示がおかしくなるCSS
date: 2014-12-14 0:00
categories: [CSS]
---

![](/img/photo/2014-12-14.jpg)

[CSS珍百景 Calendar 2014](http://www.adventar.org/calendars/341) 14日目の記事です。

案件でハマったCSSのバグです。MacのChromeでしか起こらないと思います。

<!-- more -->


## デモ

まずこちらのpenをご覧ください。

http://codepen.io/nakajmg/pen/bNVQNg

## 事象

公開するときに直ってたらアレなので以下にSSを。

正常な状態。switchボタンを2回押すと…

![正常](/img/photo/2014-12-14_01.png)


＿人人人人人人人人人人人＿
＞　表示がおかしくなる　＜
￣Y^Y^Y^Y^Y^Y^Y^Y^Y^Y￣

![変](/img/photo/2014-12-14_02.png)

表示されないといけないとこが背景色と一緒になる…

ブラウザをリサイズしたりして強制的にリドロー的なの起こすと直る。

## 原因推測

たぶんスクロールバーが起因でこの表示崩れ？が起こっていると思う。ボタンを押して切り替えたときに隠れてる要素は縦が長いのでスクロールバーが出てる。一方最初に表示されている方はスクロールバーが出ていない。この状況で`display`の切り替えで表示のオンオフを行うとレンダーするときにおかしくなる、と推測。

## 対処

`height`いじってなんか直した（覚えてない）

※ 追記

`backface-visibility: hidden;`を設定すると起こらない。

http://codepen.io/nakajmg/pen/yyOKZK

<blockquote class="twitter-tweet" data-partner="tweetdeck"><p><a href="https://twitter.com/nakajmg">@nakajmg</a> これ.innerに-webkit-backface-visibility: hidden;で解決できます。macのchromeだけアニメーションや描画などの処理がおかしい時はこれ使うと対処が可能のようです。</p>&mdash; たんしお (@_tanshio) <a href="https://twitter.com/_tanshio/status/543813364569214976">December 13, 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

`backface-visibility`の初期値はどのブラウザでも`visible`なんだけど、起こるのはChromeだけ。Blinkのバグぽい。

---

特定のOS+特定のブラウザっていう良くないやつなので早く直りますように。

現場からは以上です。
