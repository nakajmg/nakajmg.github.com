---
layout: post
title:  "未来のCSSプロパティのために"
date:   2013-12-18 16:00
categories: AdventCalendar
---

![/img/photo/2013-12-18.jpg](/img/photo/2013-12-18.jpg)
(Photo by sada_h)

---

この記事は [CSS Property Advent Calendar 2013](http://www.adventar.org/calendars/57) 18日目のエントリです。

今回はCSSのテストについて書きます。



## 仕様と実装

CSSの仕様はW3Cによって策定が進められ、その仕様を元にブラウザベンダが実装を行います。


仕様がどうあれ、CSSのプロパティがどういった風に振る舞うかを決めるのはブラウザの実装次第です。
「同じスタイルを当ててるのにブラウザによって表示が違う…」なんて経験をしたことはありませんか？

各ブラウザにCSSが正しく実装されるには、その仕様に対してのテストケースが必要です。仕様とそのテストケースを元に実装が行われれば、どのブラウザでも同じ様に表示されることが期待できるようになります。

仕様が勧告に至るにはテストケースをパスする必要があります。テストがなければいつまで経っても勧告に至りません。

CSSの仕様はどんどん増えていて、さらに機能が複雑になっています。
[Valiables](http://www.w3.org/TR/css-variables-1/)や[Selectors Level 4](http://www.w3.org/TR/selectors4/)など、これらの仕様が決まっても実装がバラバラでは結局使えないということになってしまいます。(ハックで対応なんてことはしたくないです。)

これらの仕様のテストケースは複雑で、さらに必要なテストケースも少なくありません。テストケースはボランティアによって書かれていますがまだまだ足りていません。

CSS Test Suitesについてはこちらに詳しく書かれています。

* [http://koji.ec/archives/23](http://koji.ec/archives/23)


## Test the Web Forwardというムーブメント

そんなテストケースをみんなで書いてWebを前進させようという取り組みが「[Test the Web Forward](http://testthewebforward.org/)」です。
どんな内容かは「テストを書くハッカソン」だと言えばイメージが掴みやすいかもしれません。

世界的なムーブメントで各国で開催されています。最近では[中国の深圳](http://testthewebforward.org/events/2013/shenzhen.html)で開催されました。

今年の6月には[東京でも開催され](http://testthewebforward.org/events/2013/tokyo.html)、600以上のテストケースが作成されました。

* [Web標準をテストするハッカソン –「Test The Web Forward」がついに東京に上陸](http://plus.adobe-adc.jp/post-3208/)
* [テストを通じて「より良いWebの実現」に貢献～Test the Web Forwardレポート](http://www.atmarkit.co.jp/ait/articles/1306/25/news008.html)
* [Webをより良いものにしよう！ HTML5/CSSの仕様のテストを書くハッカソン「Test The Web Forward Tokyo 2013」レポート](http://gihyo.jp/news/report/2013/06/1701)
* [Test the Web Forward を開催しました！ #testtwf](http://fumit.blogspot.jp/2013/06/test-web-forward-testtwf.html)


## html5jテスト部

東京で開催されたTestTWFという取り組みをうけて、[html5j](http://html5j.org/)の中にテスト部が設立されました。
こういった活動を継続的に行えるようにしていきたいといったことから立ち上がりました。

9月にはテスト部発のTestTWFお試し版として「Test the Web Forward Meetup (仮), Tokyo #1」を開催しました。
自分も部員の1人としてテストの書き方について少しだけ喋りました。

* [テストを書いてWebを前進させよう！「Test the Web Forward Meetup (仮), Tokyo #1」](http://html5experts.jp/myakura/2704/)


## 自分たちの未来のためにも

「テストの話はわかったけどじゃあどうしたらいいの？」「自分もWebのためにテストを書いてみたい！」という方がいたらTestTWFやhtml5jテスト部の存在を覚えておいてください。そしてイベント開催の噂などを聞きつけたら是非参加してみてください。

未来のCSSプロパティのために、そして全てのWebに関わる人のためにできることがあります。


---

[CSS Property Advent Calendar 2013](http://www.adventar.org/calendars/57)、明日は[hoto17296さん](http://www.adventar.org/users/1945)です。