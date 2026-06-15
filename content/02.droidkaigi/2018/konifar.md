---
title: DroidKaigi 2018 - コードで見るFlutterアプリの実装 / konifar [JA] を視聴した
description: Droidkaigiの登壇「DroidKaigi 2018 - コードで見るFlutterアプリの実装 / konifar [JA]」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-16T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=sRV_bSdyDjw" }
::


## Flutterとは
- OS推奨デザインに合わせた奇麗なアプリを素早く作るためのクロスプラットフォームSDK
- Google製。Dart。
- WidgetTreeでUIを構築。
- マテリアルデザインに出てくるパターンはほぼサポートされている。
- Widgetを知り、使いこなすことが高速に開発するためにとても重要。

### ゴール
Flutter知らなかった人「何か作ってみたいな」
Flutter知ってた人「業務で使えるかも」

### 補足：Dart言語について
- language-tourやった方が良い
- セットアップ
- 公式ドキュメント見て

## Widgetとは

- 要素はすべてWidget
    - たとえばアイコン自身
    - をどこに表示するか
    - どうアニメーションするか
- stateless/statefullの2種類
    - 状態を持たないWidgetはstateless
    - 通信結果、ユーザ操作により表示が変わるものはstatefullにすべき
    - 例：ローディング画面とそれによる表示の切り替え
- チュートリアルを見るとstateの考え方が分かる

###  WidgetTree
- Widgetを入れ子にしてレイアウトを組み立てていく
- IntelliJのFlutterPluginがサポートしてくれている。
- 使い方が分からないWidgetはプロパティを見て理解する。

## データの扱い
- ネットワークから取得
    - Firebaseとの連携は手厚いサポートがある
    - http通信はDartのライブラリを使う
    - httpパッケージ + async await
- モデルへの変換
    - dart:convert
    - build_valueによるdeserialize
- ローカルへのキャッシュ
    - 公式に shared_preferences plugin。 
    - 両OS共に動く。
- データベース
    - sqlite。Insert/Delete/UpdateなどのHelper有り。

## 一問一答
- CI回せる？：YES。ただしバージョンに一癖あり。
- Analyticsある？：YES。
- Firebaseをつかう。
- プッシュある？：YES。
    - FirebaseMessagingPluginを使う。
- アノテーションある？：YES。
    - すべてWidgetで表現している都合により、Androidと全然違う。
- ユニットテストはできる？：YES。
    - mockito.dart, test/test.dart。
- 多言語対応できる？：YES。
    - dart:intlを使う。
    - ただしこれを使うとWidgetテストがこけるから、いい感じに動かすためのワークアラウンドが必要。
- クラッシュログの収集方法は？
    - Firebase Crash Reporting or Sentry をつかう。
- ライブラリを探す方法は？
    - 公式プラグイン or dart library から検索する。

## ゴールに対する答え：業務で使えそう？
「使えそうだけど、やってみないとわからない。結局覚悟次第。」