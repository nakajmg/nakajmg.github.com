---
layout: post
title:  "SassとGruntとStyleGuideと"
date:   2013-12-16 0:00
categories: [tech]
tags: [AdventCalendar,Sass,Grunt]
---

![/img/photo/2013-12-16.jpg](/img/photo/2013-12-16.jpg)

この記事は [Frontrend Advent Calendar 2013](http://www.adventar.org/calendars/62) 16日目のエントリです。

今年は色々なツールをワークフローに導入したり使用したりしました。中でもSassとGruntとStyleGuideツールの導入が印象深いので簡単におさらい的に紹介します。

<!-- more -->

## [Sass](http://sass-lang.com/) & [Compass](http://compass-style.org/)


「CSSでも十分書けるし」と思って導入を渋ってたSass。OOCSSとかに関するスライドなどから影響を受けてたこともあって、実務で書いてたCSSをSCSSで全部書きなおすというところから始めました。

* [モバイル時代におけるCSSの設計と実装](http://ameblo.jp/ca-1pixel/entry-11413319214.html)
* [CSSプリプロセッサの取扱説明書](http://www.slideshare.net/hiloki/css-16247228)
* [ちゃんとCSSを書くために - CSS/Sass設計の話](http://www.slideshare.net/hiloki/a-good-css-and-sass-architecture)
* [WebデザイナーのためのSass/Compass入門](http://www.slideshare.net/schoowebcampus/ishimoto)
* [SMACSS](http://smacss.com/)
* [SassとCSS設計](https://app.codegrid.net/entry/sass-basic)

CompassはMixin便利だなーと思って使いまくってたんですが、[このエントリ](http://t32k.me/mol/log/good-bye-compass-good-bye-ruby/)で書かれてることに共感したことから[Autoprefixer](https://github.com/ai/autoprefixer)を使うようにして脱Compassしました。

* [Autoprefixer ― CSSのベンダー接頭辞をいろいろする](http://myakura.hatenablog.com/entry/2013/09/30/035244)


## [Grunt](http://gruntjs.com/)

JSのタスクランナー。

導入する前は「Sassのコンパイルくらいならwatchオプションでコンパイルすればいいし別に…」とか思ってました。
でもGruntにやらせるタスクってのはなにも監視させるタスクばかりじゃないと気づいてからはめっちゃ便利だと気づきました。

開発中は`connect`で建てたローカルサーバを使い`watch`で`sass`のコンパイルとかをさせて`livereload`する、というスタイルがだいぶ楽でSimpleHTTPServerとかを使う率が減りました。

本番環境やステージングにアップロードするまえには`autoprefixer`や`csso`や`uglify`といった最適化系のタスクをまとめて実行させて、成果物は`copy`で別のフォルダに持っていって`growl`でタスクの終了を知らせるというスタイルでやってます。CSSの軽量化とかJSの結合って「最後に1回やりゃいっかな〜」とか自分は思いがちだったけど、Gruntのおかげで手間と感じなくなったのでこまめにやるようになりました。

### よく使うプラグイン

---

#### [grunt-contrib-watch](https://github.com/gruntjs/grunt-contrib-watch)

ファイル監視。


#### [grunt-contrib-connect](https://github.com/gruntjs/grunt-contrib-connect)

ローカルサーバ建てる。建てると同時にブラウザで開く。


#### [grunt-contrib-sass](https://github.com/gruntjs/grunt-contrib-sass)

Sassのコンパイル。


#### [grunt-contrib-copy](https://github.com/gruntjs/grunt-contrib-copy)

コピーする。


#### [grunt-contrib-uglify](https://github.com/gruntjs/grunt-contrib-uglify)

JSの結合圧縮と難読化。


#### [grunt-autoprefixer](https://github.com/nDmitry/grunt-autoprefixer)

CSSのベンダープレフィックスをよしなに付けて(外して)くれる。ターゲットブラウザをバージョンとかで指定できる。


#### [grunt-csso](https://github.com/t32k/grunt-csso)

CSSの最適化。プロパティの並び順とかそろえてくれる。


#### [grunt-growl](https://github.com/alextucker/grunt-growl)

通知出してくれる。Gemの`terminal-notifier`のインストールが必要。


#### [grunt-jekyll](https://github.com/dannygarcia/grunt-jekyll)

色々あって使わなくなった。記事を書くときはJekyllの`serve --watch`で書く。デザインいじるときは`connect`と`watch`で。


#### [grunt-contrib-imagemin](https://github.com/gruntjs/grunt-contrib-imagemin)

画像の圧縮とか減色。


---

今年は色々なツールを使ってみましたが、ワークフローを激的に変えたのはやはりGruntです。便利なツールは数多くありますが、これらのツールを一つ一つ使ってたのではコードを書く以外に時間を多く割くことになってしまいます。細々としたタスクはまとめてGruntにやらせて、もっと大事だと思う部分にフォーカスするのがいいと思います。


## [Jekyll](http://jekyllrb.com/)

静的サイトジェネレータ。このブログを作るのに使いました。以前はBloggerで適当に書いてましたが、GithubPagesでやってみようかなと思いたち使ってみました。

テンプレートやHTMLファイルのインポートなど、ブログを楽に書くための機能がそこそこそろってるのもあって割と気に入ってます。ただカスタマイズしたいと思った部分がいじれない場合があるので、そこは割りきって使うものなのかなと思います。

めんどくさいソーシャルボタンの設置は[jQuery.socialthings](https://github.com/Takazudo/jQuery.socialthings)というブラグインを使って、URLやタイトルの設定を自動でやってくれる用に設定しました。

OGPの設定も色々自動でできるので一回設定したらいじる必要がなくて大変楽です。

参考リンク

* [Jekyllで作るシンプルWebサイト](https://app.codegrid.net/entry/jekyll-introduction)
* [OGPの設定とかSNS関係のところ修正した](http://kawaken.github.io/memo/2013/08/30/OGP%E3%81%AE%E8%A8%AD%E5%AE%9A%E3%81%A8%E3%81%8BSNS%E9%96%A2%E4%BF%82%E3%81%AE%E3%81%A8%E3%81%93%E3%82%8D%E4%BF%AE%E6%AD%A3%E3%81%97%E3%81%9F.html)
* [Takazudo / jQuery.socialthings](https://github.com/Takazudo/jQuery.socialthings)

## CSS StyleGuide

CSSのスタイルガイド作成ツール。3つ使ったのでそれぞれの感想を。

### [StyleDocco](http://jacobrask.github.io/styledocco/)

Node製のスタイルガイドツール。

簡単に書けてそれなりに良い感じのスタイルガイドができる。でもスタイルガイドのスタイルのカスタマイズがしづらい。

完成度は大変高いと思います。

* [StyleDoccoによるCSSスタイルガイドの導入](http://ameblo.jp/ca-1pixel/entry-11453624925.html)
* [CSSプリプロセッサでスタイルガイド](http://inkdesign.jp/posts/css-preprocessor-styleguide/)

### [KSS](http://warpspire.com/kss/styleguides/)

Ruby製のスタイルガイドツール。

StyleDoccoと比べると導入の敷居が若干高いかな？とは思うものの、スタイルのカスタマイズなどStyleDoccoで手の届かなかった部分に手が届くといった印象。

小さなプロジェクトはStyleDoccoで、ある程度大きめなプロジェクトはKSSのほうが良いのかなと個人的に思う。

Nodeに移植したものもある。

* [スタイルガイドジェネレータの KSS が良さそう](http://text.ykhs.org/2013/01/06/kss.html)
* [KSS-node](https://github.com/hughsk/kss-node)
* [grunt-kss](https://github.com/t32k/grunt-kss)
* [イケてるスタイルガイドを簡単に作れるgrunt-kssについて紹介するよ](http://qiita.com/t32k/items/9e03e80061de21411765)


###  [Kalei StyleGuide](http://kaleistyleguide.com/)

JavaScriptでスタイルガイドを生成するツール(ライブラリ)。

StyleDoccoとKSSはスタイルガイドの生成にコンパイルの作業が必要だが、Kaleiはコンパイルレスでブラウザで実行されたときにスタイルガイドを生成する。

コンパイルレスってのがかなり楽で「生きたスタイルガイドを作る」という目的を達成するためには大変よろしいのではと思います。実プロジェクトでも使ってみましたが手間がほとんどかからない(ワークフローの邪魔をしない)ので気に入ってます。

(ただ自分の使い方が悪いのか、スタイルガイドのページを見まくってるとメモリリークっぽい感じで重くなってブラウザが強制終了する。。。)

* [Kalei - コンパイルレス！JavaScriptで自動生成されるスタイルガイド](http://www.moongift.jp/2013/11/kalei-%E3%82%B3%E3%83%B3%E3%83%91%E3%82%A4%E3%83%AB%E3%83%AC%E3%82%B9%EF%BC%81javascript%E3%81%A7%E8%87%AA%E5%8B%95%E7%94%9F%E6%88%90%E3%81%95%E3%82%8C%E3%82%8B%E3%82%B9%E3%82%BF%E3%82%A4%E3%83%AB/)


## Zynga JukeBox & Audiosprite

ちょっとこれまでのツールと趣向が違いますが、ブラウザでの音声再生機能を実装する際に大変役に立ったので紹介。

### [Zynga JukeBox](https://github.com/martensms/martens.ms/tree/master/raw)

ブラウザで音声再生するためのライブラリ。

使い方などは[Qiita](http://qiita.com/nakajmg/items/7be91626113bfc10846a)に書きました。

スマホで音を鳴らすのには色んな制約があって、その制約を乗り越えるためにオーディオスプライトという手法が使われている。CSSスプライトのように音声を1つのファイルにつなげて、再生する部分を変えて色んな音をタイミング良く再生するというもの。

Zynga JukeBoxはオーディオスプライトの再生をJSON形式の設定ファイルで制御してくれて、異なる拡張子のオーディオファイルもブラウザに合わせて再生してくれるという賢いライブラリ。

スマホ向けのノベルゲームのエンジンを作る際に使ってみましたが、機能的にも使いやすさ的にもかなりオススメできるなと思います。

### [Audiosprite](https://github.com/tonistiigi/audiosprite)

Node製の音声ファイル結合ツール。

Audiospriteは音声ファイルの結合ツールで、結合のついでにZyga JukeBoxで使えるJSONファイルも作ってくれます。2つを合わせて使うことでより手軽にブラウザでの音声制御が行えます。


## さいごに

最近のフロントエンドはNodeやRubyで作られたツールが非常に多く、これらを使う、使わないによって開発効率などに大きな差が出てくると考えています。導入コストはかかるかもしれませんが、どのツールもそのコストに見合ったぶんのリターンがあると思います。

フロントエンドのツールは発展が早く、どんどん新しいものが出てきますが、それらのツール全部を使いこなす必要はなく、自分に合ったものを少しずつ使って取り込んでいくのが大事かなと思います。


---

[Frontrend Advent Calendar 2013](http://www.adventar.org/calendars/62)、明日は[Yasuhisa Hasegawaさん](http://www.adventar.org/users/806)です。
