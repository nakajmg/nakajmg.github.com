---
layout: post
title:  "GitとJenkinsとSTF(仮) at Frontrend Vol.6"
date:   2013-11-17 10:00
categories: [勉強会]
tags: [Frontrend]
---

![/img/photo/2013-11-17.jpg](/img/photo/2013-11-17.jpg)

[Frontrend Vol.6](http://frontrend.github.io/events/06/)に参加してきた。  
感想と軽くメモした内容をつらつらと書いておく。

<!-- more -->

[Frontrend/06 @togetter](http://togetter.com/li/590889)

---

今回はGit・Jenkins・Androidのテストツールといった内容。

フロントエンドからちょっと外れてる様に見えるかもしれないけど、GitとJenkins(CIツール)はフロントエンドを続けて上でも必要なツールだと思った。


## いつやるの？Git入門 [@matsukaz](https://twitter.com/matsukaz)

<iframe src="http://www.slideshare.net/slideshow/embed_code/28304397" width="427" height="356" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC;border-width:1px 1px 0;margin-bottom:5px" allowfullscreen> </iframe>
<div style="margin-bottom:5px"> <strong> <a href="https://www.slideshare.net/matsukaz/git-28304397" title="いつやるの？Git入門 v1.1.0" target="_blank">いつやるの？Git入門 v1.1.0</a> </strong> from <strong><a href="http://www.slideshare.net/matsukaz" target="_blank">Masakazu Matsushita</a></strong> </div>

今まで聞いたGitの解説で一番わかりやすかったかも。  
`pull` `fetch` `reset` `rebase` とかのコマンドはきちんと理解できてなかったのもあって勉強になった。  

特に`rebase`と`merge`はわりと混乱してたのがスッキリした。  
ブランチの操作も詳しく丁寧に説明してくれててすごく良かった。
セッションで紹介されてたブランチの操作を学べるサービスも遊び感覚でやってみようと思う。

[Learn Git Branching](http://k.swd.cc/learnGitBranching-ja/)

以下メモ

---

### Gitのメリット

* commitの対象管理が簡単
* commitした内容を修正できる
* pushとfetch以外の操作がローカルで完結してる
    * 最新の状態をローカルに反映しておけばオフラインでも作業できる
* 効率よくデータを保持
    * 圧縮したり色々

やはりSubversionと比べるとGitのほうが色々捗るなーと感じる。

### Gitの3つのデータ領域

* 作業ディレクトリ(ワークツリー)
* ステージング・エリア(インデックス)
* Gitディレクトリ

作業ディレクトリ <-> ステージング <-> Gitディレクトリ の3つの振る舞いを把握すればGitは怖くない。  
ファイルを追加・変更したりコミットしたりチェックアウトしたりと、何をしたらどこにどうデータが反映されていくかを理解すれば各コマンドの動きも理解できそう。

### mergeとrebase

* 適材適所でつかう

別のブランチから変更を反映するっていうくくりでは一緒だけど、ワークツリーがどう動くかはちゃんと理解しておくといいのかなと。  
発表資料を見ればつかめると思う。

### リンク

* [Pro Git](http://git-scm.com/book/ja)
* [GitHub Flow in the Brower](https://github.com/blog/1557-github-flow-in-the-browser)
* [Learn Git Branching](http://k.swd.cc/learnGitBranching-ja/)
* [Git Cheatsheet](http://www.ndpsoftware.com/git-cheatsheet.html)
* [Git初心者が見るべきサイトまとめ](http://matome.naver.jp/odai/2136491451473222801)


## フロントエンジニアとCIとテスト [@st44100](https://twitter.com/st44100)

<iframe src="http://www.slideshare.net/slideshow/embed_code/28353683" width="427" height="356" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC;border-width:1px 1px 0;margin-bottom:5px" allowfullscreen> </iframe>
<div style="margin-bottom:5px"> <strong> <a href="https://www.slideshare.net/st44100/ss-28353683" title="ふぃ" target="_blank">ふぃ</a> </strong> from <strong><a href="http://www.slideshare.net/st44100" target="_blank">Satake Hiroyuki</a></strong> </div>

Jenkinsなお話がメイン。フロントエンドでCIツールを使う利点、CIツールを使った上で他のエンジニアとどう絡むかとか「Jenkins使ってみようかな」と思わせる内容だった。  
特にJenkinsのビルドの成果物を利用することで"成果物から属人性を排除する"っていう考えは大事だと思った。

Jenkinsになにをやらせるかっていう点で紹介されてた各種ツールも、Jenkinsを使わないとしても覚えて(使って)おいて損は全くなさそう。
Gruntを使ってる人ならそのタスクをJenkinsにやらせるだけなので、無理なく導入できるなと感じたし自動化を一歩先に進められるんじゃないかなと思う。

以下メモ

---

### インストール

* `brew install jenkins`

簡単。

### 成果物の管理

* 個人の環境の違いでビルドの成功・失敗が変わることがある
* Jenkinsのビルド結果を成果物にすればその点をクリアできる
    * 属人性の排除

ある特定の人の環境でしかビルドできないとかあったとき、その人がいなくなったら誰もビルドできないといった事態にならないように。

### テスト

* 単体テスト
    * Jasmine
    * PhantomJS
* 複合テスト
    * CasperJS

### ページのSSをとる

* CasperJSで自動で全ページのSSをとる
    * 修正確認の時とかにブラウザで確認する時間をある程度短縮できる
* wraithでSSのdiffを取る
    * 修正前と修正後のSSのdiffを取って表示してくれる
        * 遅いのが難点
        * 一定間隔で裏で自動実行させておくとかするといいかも
        * PhantomCSSでモジュール単位で比較すれば早くなるかも

GruntでCasperJSのタスクを設定しておけばJenkinsの成果物としてSSが撮れる。Jenkinsを使わないとしてもCasperJSは導入しておきたい。

### リンク


* [Jenkins](http://jenkins-ci.org/)
    * [CloudBees](http://www.cloudbees.com/#slide-2)
    * [CCMenu](http://ccmenu.sourceforge.net/)
    * [Jenkins Plugins](https://wiki.jenkins-ci.org/display/JENKINS/Plugins)
* [Jasmine](http://pivotal.github.io/jasmine/)
* [PhantomJS](http://phantomjs.org/)
* [CasperJS](http://casperjs.org/)
    * [PhantomCSS](https://github.com/Huddle/PhantomCSS)
* [wraith](https://github.com/BBC-News/wraith)


## Android端末の動作検証の課題を解決: STF [@gunta85](https://twitter.com/gunta85) & [@sorccu](https://twitter.com/sorccu)

<script async class="speakerdeck-embed" data-id="f02a1610323d0131099e127da236efac" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>

先日行われた[Frontrend x Chrome Tech Talk Night Extended](http://frontrend.github.io/events/chrome/)のLTで紹介されてたAndroid検証用ツール「STF(仮)」の紹介。

このツールとにかくすごい。いまフロントエンドエンジニアがAndroid向けの開発に対して抱えてる不満や悩みを全部解決しちゃうんじゃないかとまで思う。

OSSで少しずつ機能を公開する予定らしいのでフロントエンドの開発効率が飛躍的に向上する日も近い。ありがたや

以下メモ

---

### Androidについて

* 国内250種類
* 世界12000種類…

これにOSのバージョン違いを考えると…いや、もう考えたくないやめた。

#### バグバグバグ

* 各メーカーが独自機能と独自バグを盛り込む
    * エミュレータ遅い
    * エミュレータで再現不可能
    * GENYMOTION
        * 実機と違うし

#### どうする？

* 物理的に操作
* ChromeのUSBデバッグ？
    * 2.3がシェア30%~40%ある
    * Chrome入らないしそもそも標準ブラウザと違う
        * だめだ

#### つらい

* 充電
    * 気づいたら切れてるし時間かかるしつらい
* 操作方法
    * 違いすぎてつらい

---

### STF(仮)の出番だ

* __ブラウザから全端末を検証する__

* URLを開く
    * 標準ブラウザ・Chrome・WebViewどれでも指定できる
* リモート操作
    * レスポンスはやい。3Gでも全然いけてる
* SS撮れる
    * ページ全体も撮れる
    * SSにURLが発行される
        * 他の人にURLコピペで送れる
* CPU・GPUの負荷状況が見れる
    * マルチコアでコア数減らして動作してるとかリアルタイムでわかる
* 転送速度のグラフ表示
    * USBの転送速度。2M~5Mくらい
* 任意のJavaScriptの実行速度計測
    * 速い順にソートしたりできる
* ローカルページをリモート端末で表示
    * リバースポートフォワーディングしてlocalhostとかのページをリモートの端末で表示できる
    * 3G回線でもOK。同一ネットワークとか気にしなくてもいい
* weinreを使ったInspect
    * リモート端末に対してDevToolsみたいにリアルタイムでDOMとかCSSをいじれる
* ハードウェアボタンの制御
    * 音量の増減とかできる
* 端末リソースの確保と解放
    * 検証したい端末にチェックするだけ

書ききれない。

デバッグする端末はSTFサーバ？につないでおくことでどっからでも操作できる。それこそ海外でも大丈夫らしい。  

会社が保有してる端末を使って開発する場合、誰かが端末を占有したままで、使いたい端末を使えるまでに時間がかかるなんてことはザラにある。  
端末が手元に来ても充電が切れててすぐ使えなかったり、充電ケーブルどこいったみたいなこともよくある。

複数のAndroidで画面表示を確認したいだけなのに物理的・ソフトウェア的な色んな要素が邪魔してほんとにめんどくさい。時間の無駄。

STF(仮)は色んな問題を解決してくれると思う。機能的にもすばらしいし、目指してるヴィジョンみたいなものもすごく共感できる。グンタイケメン。  

今まで無駄に費やしてた時間を短縮できるようになればリリースのサイクルを早めたり、もっと注力したいところに時間を使えるようになる。

すっごく期待してる。


## 次回開催を期待して

内容すごく良かった。

GitもCIツールもちゃんと使えるようになっておかないと置いてかれる気がする。

Androidに関しては思うところがいっぱいあるけどSTF(仮)応援してる。

次回開催も(ピザとビール)期待してます。
