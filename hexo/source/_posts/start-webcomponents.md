title: Web Components使うときにハマったポイント3つ
date: 2014-8-25 8:00
categories: [tech]
tags: ['Web Components']
---

![x-marked](/img/photo/2014-08-25.png)

「ブクマばっかしてても手を動かさなきゃ嘘になるぜ」と言われたような気がしたので、ウェッブコンポーネンツを使って、`x-marked`という要素を作ってみた。`x-marked`タグの中にMarkdownテキストを書くとHTMLにレンダリングしてくれる。

作ってるときにハマりポイントがいくつかあったので記しておく。

<!-- more -->

* デモ: [nakajmg.github.io/x-marked/](http://nakajmg.github.io/x-marked/)
* ソース: [github.com/nakajmg/x-marked](https://github.com/nakajmg/x-marked)
  

## ハマりポイント3つ

ハマったポイントは以下の3つ。

* インポートされたHTMLが指す`document`オブジェクト
* `<template>`に書いた`<link rel="stylesheet">`の扱い
* `<content>`の中身を取るタイミング


## インポートされたHTMLとインポートしているHTML内での`document`

`<link rel="import">`で読み込んだHTMLの中で`document.querySelector('#template-name')`みたいなことをするとエラーになる。これはインポートされたHTMLの中にある`<script>`を実行しているのが、インポートしている側のHTMLなので`<template id="template-name">`が参照できないことによる。

これはインポートされる側で使う`document`を正しく指定しておく必要がある。

```javascript
var doc = document.currentScript.ownerDocument;
var template = doc.querySelector('#template-name');
```

## スタイルシートが読み込まれない

こんな感じでテンプレートに`hoge.css`という外部スタイルシートを反映したいと思ってもこれは適用されない。

```html
<template>
  <link rel="stylesheet" href="hoge.css">
  <div class="hoge">
    hoge~
  </div>
</template>
```

これは[仕様](http://www.w3.org/TR/shadow-dom/#inert-html-elements)らしいので、インラインに展開するか、そもそも外部スタイルシートを使わない(リクエスト増えるし)。でもインラインにスタイルゴリゴリ書くのは苦痛だと思うので、事前にコンパイル的な作業(Vulcanize?)を挟んでインラインに展開するようにしとくとヨサソウ。

自分は非同期で読み込んで`shadowRoot`に`<style>`にぶち込む関数を定義した。いいやり方じゃないと思うので参考程度に。

[https://github.com/nakajmg/x-marked/blob/039b0f4ab1f96c98357dee17e6bb5578efe20f56/x-marked.html#L39-L76](https://github.com/nakajmg/x-marked/blob/039b0f4ab1f96c98357dee17e6bb5578efe20f56/x-marked.html#L39-L76)


## `<content>`の中身を取得するタイミング

`<template>`の中に`<content></content>`てのを置いておくと`<x-hoge>コンテント</x-hoge>`としたときに`<content></content>`の部分が`コンテント`に置き換わる。

`x-marked`ではここに書かれたMarkdownのテキストを取得して、それをHTMLに変換して反映してる。この`<content>`の取り方でちょっとだけハマった。

### registerElementの4つのライフサイクル

要素を登録する`registerElement`には特定のタイミングで呼ばれるコールバックが4つあって、これを使って初期化を行ったり、属性の変更により処理をしたりする。

|タイミング|名前|
|---|---|
|要素のインスタンスが作られたとき|createdCallback | 
|要素がドキュメントに追加されたとき|attachedCallback|
|要素がドキュメントから削除されたとき|detachedCallback|
|属性に変更があったとき|attributeChangedCallback|

`<content>`が置き換わるのは`attachedCallback`のタイミングで、最初`createCallback`の中で`<content>`を取ろうとして上手くいかず。少し考えれば当然っぽい。


## Web Componentsができること

この3つのポイント、Polymerを使うと全部Polymer様がよしなにやってくれる。便利なんだけど、実際に使って直面してみないとWeb Componentsでできることが正しく把握できないと思う。Polymerの使い方覚えるまえにちゃんと触っておきましょう。

### Web Componentsやっぱ難しい？

Web Componentsに関する記事でだいたい触れられることだけど、何か作ろうと思ったらWeb Componentsを構成する4つの仕様をまず覚えないといけない。

* HTML Templates
* Custom Elements
* Shadow DOM
* HTML Imports

仕様自体を理解するのは難しいけど、それぞれの使い方を覚えるくらいなら少し手を動かせば大丈夫なはず。使い方を覚えるのは大丈夫なんだけど「これを組み合わせて一つのモノを作る」ってなったときが色々難しい。仕様もちょこちょこ変わってる最中だし。



まだまだ情報が少ない。Web上にあるWeb Componentsの記事、中には古くて役に立たないのも結構ある。HTML5 Rocksに書いてあるからといって信用してはいけない。Web Componentsの紹介と見せかけたPolymerの記事もあるけどイコールじゃないから注意しよう。

---

参考リンク

* [Polymer と Web Components の違い9選（もとい Polymer の便利機能）](http://havelog.ayumusato.com/develop/webcomponents/e603-diff_of_polymer_and_webcomponents.html)
* [Polymer/platform.jsでdocument.currentScriptが動かない](http://d.hatena.ne.jp/hokaccha/20140125/1390613024)
* [HTMLImportsするHTMLのコンテキストになるdocument](http://qiita.com/1000ch/items/b24e387d6102ee20fbba)
