---
title: DroidKaigi 2022 - 2022年の動画再生アプリの作り方 | oidy [JA] を視聴した
description: Droidkaigiの登壇「DroidKaigi 2022 - 2022年の動画再生アプリの作り方 | oidy [JA]」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-18T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=mAE5YDtcox4" }
::

がっつり実装方法が説明されてて、動画プレイヤーを作りたいならこれをみるだけで行けそう。

## これまでのMediaPlayer

### 2008年：MediaPlayer
- MediaPlayer
- VideoView

### 2014年：MediaSession
- AndroidWear, Auto, TVの発表
- 外部との連携

### 2017年：Picture in Picture
- Activityを小さなウィンドウとして表示
- マルチウインドウの延長線

### 2020年：LargeScreen/fordable
- マルチウインドウ機能の強化Activityを小さなウィンドウとして表示
- JetpackWindowManagerがリリース
    - ⇒どのライブラリを使ってどう実装すればよい...？

#### ExoPlayer
- MediaPlayerにない多くの機能を備えたメディア再生ライブラリ
    - PlayerView
    - ExoPlayer

#### Jetpack Media2
- VideoView
- MediaPlayer
- MediaSession
 
#### Jetpack Media3
- ExoPlayerが統合された。
- 従来のExoPlayerが非推奨になるため、Media3への移行が必要。
- パッケージ名と一部のクラス名の置換だけでOK。
- スクリプトも公開されている。

## 動画再生アプリの作り方

### 動画再生画面（Activity）＋ExoPlayerの場合は以下の構成
- 画面としてActivityを用意
- PlayerViewを作ってActivityで表示
- ExoPlayerをPlayerViewにセット
- MediaItemで再生対象を指定。
- 適切にオブジェクトを開放・破棄。

### ただし、Activityが破棄されるとPlayerも破棄されるのが問題
- ServiceにPlayerを持たせることで改善できる
- MediaSessionServiceを使うとPlayerViewとExoPlayerとの連携周りを良い感じにやってくれる。
- Activityからだけでなく、外部からもMediaをコントロールできるようになる。

### Picture in Picture に対応
- AndroidManifestでPicture in Picuture に対応したActivityである設定を追加。
- Picture in Picuture モードに表示を切り替える処理を追加。
- デバイスがサポートしているかのチェックも必要。
- Picture in Picuture モードでの表示でUIを更新

### 折り畳み式デバイスに対応
- JetpackWindowManagerを使うとデバイスの状態を監視できる。
- Viewベース：ConstraintLayoutを使う。
- JetpackCompose：Composableの中にPlayerViewを表示する。