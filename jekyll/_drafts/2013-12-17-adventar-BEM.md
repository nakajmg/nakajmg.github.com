---
layout: post
title:  "変数でBEMる"
date:   2013-12-17 0:00
categories: AdventCalendar
---

![/img/photo/2013-12-17.jpg](/img/photo/2013-12-17.jpg)

この記事は [BEM Advent Calendar 2013](http://www.adventar.org/calendars/61) 17日目のエントリです。

このエントリはCSSのBEMのことはあまり書きません。

ちゃんとしたBEMのエントリを読みたい人は[BEM Advent Calendar 2013](http://www.adventar.org/calendars/61)の他のエントリを見てください。



## おれとBEM

BEM歴は3ヶ月くらいです。ゆるBEMMERです。

BEMり方は色々な人が色々と考えて色々書いてます。

* [http://bem.info/method/](http://bem.info/method/)
* [juno / bem-methodology-ja](https://github.com/juno/bem-methodology-ja)
* [MindBEMding – getting your head ’round BEM syntax](http://csswizardry.com/2013/01/mindbemding-getting-your-head-round-bem-syntax/)
* [BEMという命名規則とSass 3.3の新しい記法](http://blog.ruedap.com/2013/10/29/block-element-modifier)
* [CSSの命名規則にBEMを取り入れてみる](http://dskd.jp/archives/34.html)
* [BEMによるフロントエンドの設計](https://app.codegrid.net/entry/bem-basic-1)

今までBEMって書いたのは主に自分だけがさわるCSSだったので、これらの概念やルールをあまり厳格に守る気でBEMってはいません。

自分がBEMる際に重視しているのは__「同一の見た目のモジュールを別のタイミングで見たときに全く同じ形でBEMれるかどうか」__です。

同じ形でBEMれないならば、それは自分自身の中で一定のルールが出来上がっていないということです。この状況ではいくらBEMっても全体としてふらふらと定まらないクラス付けが行われ、統一感のないCSSができあがるのではと思います。

BlockやElementの取り方はかなり悩みますが、自分の思考を後から辿れる形になっていれば良いと割りきってBEMるようにしています。

※ 複数人がさわる可能性があるならば厳格さというか、統一されたルールが必要だと思います。


## 変数でBEMる

ここからが本題です。

自分はBEMのBlock・Element・Modifierという分け方を超拡大解釈してSassの変数名付けをBEMっぽくしてます。

例えば

{% highlight sass %}
$size__font--small: 10px;
$size__font--normal: 14px;
$size__font--large: 18px;
{% endhighlight %}

や

{% highlight sass %}
$color__font--body: #333;
$color__font--header: #59bb0c;
$color__font--link: #0096D6;
$color__shadow--white: rgba(255,255,255,.3);
$color__shadow--black: rgba(0,0,0,.3);
{% endhighlight %}

とか

{% highlight sass %}
$img__sprite--main: '/img/sprite_main.png';
$img__global--author: '/img/author.png'; 
$img__global--bg-noise: '/img/bg-noise.png'; 
{% endhighlight %}

とかね。

大分類__中分類--小分類にするだけ。

こんな感じで命名してくと変数名がかぶることもほぼないし、「変数名なんだったっけ」なときにエディタの補完なしでも思い出せます。

もはやBEMでもなんでもないけど、変数名をつけた時の思考を辿るための道標としてBEMっぽいメソッドを利用してるというお話でした。


## おわりに

こんなしょーもないエントリ書いていいもんか迷ったけど、他の人のエントリ読んでたらBEM疲れしたので書いた٩(๑❛ᴗ❛๑)۶

---

[BEM Advent Calendar 2013](http://www.adventar.org/calendars/61)、明日は[yomotsuさん](http://yomotsu.net/blog/2013/12/12/bem-with-namespace.html)です。