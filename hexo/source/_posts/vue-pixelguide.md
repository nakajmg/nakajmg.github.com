---
layout: post
title:  "PixelGuideをVue.jsで書きなおしてる"
date:   2015-2-2 1:00
categories: ['tech','CodeGrid']
---

![](/img/photo/2014-3-1.png)

ちょうど1年前くらいに作った[PixelGuide](/blog/2014-03-01/pixelguide.html)を[Vue.js](http://vuejs.org/)で書きなおし始めた。

書きなおそうと思ったきっかけは[CodeGrid](https://app.codegrid.net/)でVue.jsの連載を始めるにあたって色々試す題材としてヨサソウだと思ったので。

ガイドの追加機能までできたやつのデモ（Chromeだけ動く）＝＞[Vue-PixelGuide demo](https://nakajmg.github.io/Vue-PixelGuide/demo/)。

### 操作方法

ルーラー上でクリックするとガイド追加、そのままドラッグして位置変更。

<!-- more -->

## もとのやつ

元々のはガイドを引く部分が全部ライブラリまかせで、それをラップして拡張にしている感じ。拡張メニューの部分とのやりとりにjQuery使っててめちゃくちゃ汚い。

## Vue.js版

ライブラリは使わず。

ルーラーの表示もViewModelでやっててリサイズで伸縮するようになっている。ガイドの追加はViewModelのデータにクリックされた座標を追加するだけな感じ。

## ヨサ

Vue.jsに限らずデータバインディングが使えると本当に楽。「要素を作ってイベント張って値を入れて…」とか「クリックしたらこいつにイベント飛ばしてこっちの値を変更して表示を変えて…」みたいな処理を書く必要がほとんどない。

## ヨクナサ

Vue.jsは同じことやるにも異なる記述ができて自由すぎる感がある。適当にガーッって書いても動くんだけど、コンポーネント分割したりパーシャルにしたりイベントハンドリングだったり、もうちょい制限してくれたほうが色々やりやすい気がする。

一人で書いてるぶんには「ブレてる」で済むんだけど、これが複数人で使うってなると結局規約的なの作る必要あって、フレームワークは制約が厳しいほうがよいのでは、と思いはじめそうになっている。

## でもね

こうかな？って書き方すると思ったとおりに動くのでVue.js好きです。大きいアプリに使うにはかなり知見が必要なんだけど趣味でパパッと動くもの作るにはとてもヨイです。

## それでは

[CodeGrid](https://app.codegrid.net/)で「[Vue.jsを使いこなす](https://app.codegrid.net/entry/vue-1)」という連載が始まりましたのでよければ購読よろしくおねがいします。無料記事も50以上あるので一度読んでみてください。