---
title: DroidKaigi 2022 - Compose for Desktopで始めるAndroid開発効率化ツールの作成 | Yusuke Katsuragawa [JA] を視聴した
description: Droidkaigiの登壇「DroidKaigi 2022 - Compose for Desktopで始めるAndroid開発効率化ツールの作成 | Yusuke Katsuragawa [JA]」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-18T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=jpXdqy3_WUk" }
::

## Compose for Desktopとは

- デスクトップ・Web向けフレームワーク
- JetpackComposeと同じ宣言型でUIを構築可能
    - Androidエンジニアであれば学習コストが低い（＝使いやすい）
- 複数のデスクトッププラットフォームに対応
- デスクトップアプリ向けの機能の提供
    - メニューバー
    - メニュートレイ
    - コンテキストメニュー
    - 通知

## 開発環境
- Intellij IDEA Community 2022
- Compose Multiplatform IDE Support
    - Intelliy IDEAのプラグイン
    - Composeをプレビューするための機能
- Kotlin
- Kotlin Coroutine
- Kotlin Serialization
- Adam
    - ADB のヘルパークラス
    - Kotlin Coroutine にも対応

## デモ
Androidアプリを開発するにあたって頻繁に設定する機能を簡単に切り替えできるツール

- Wi-Fi／データ通信OFF
- ダークモード
- スクリーンショット

## 良い所
- JetpackComposeと同じ感覚でUIを構築できる
- Androidアプリ開発で得た知識を流用できる

## 悪い所
- Compose for Desktop は JetpackComposeの後追い
- JetpackComposeでは使えるけど、Compose for Desktop ではまだ使えない機能
- プレビューが弱い
- ドキュメントが少なめ