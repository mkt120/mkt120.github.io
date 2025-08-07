---
title: DroidKaigi 2018 - 開発者が知っておきたい通知の歴史 / kobakei [JA] を視聴した
description: Droidkaigiの登壇「DroidKaigi 2018 - 開発者が知っておきたい通知の歴史 / kobakei [JA]」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-15T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=IlFT4XQCivg" }
::

## 通知
- 通知はユーザには重要な機能で頻繁に変更が入る
- sdkバージョンの分岐が必要
- 同じ実装でも見え方がosごとに違って動作確認が大変

## 大きな変更が4回入った
- API 16 アクションとスタイル
- API 21 マテリアルデザイン
- API 24 バンドル リプライ
- API 26 通知チャンネル

## 必須設定
- title
- Text
- small icon
- 背景透過、白塗り
- ID

## ほぼ必須
- Color
- デフォルト
- pendingIntent
- autoCancel
- ticker

## Largeアイコン
- 画像ダウンロードを含む通知を表示時はサービス推奨
- ブローキャストレシーバは時間がかかる処理には向かない
- 非同期処理ジョブを使うと楽

## バイブレーションパーミッション
- 4.1までは必須
- 4.2以降は不要

## マテリアルデザイン
- デザインが大幅に変わった

## アクション
- 通知につくボタン
- 複数設定可能
- 各アクションにインテント設定可能
- api16以降のみ
- アイコンは設定したほうが良い
- ただしsvgが使えない

## ダイレクトリプライ
- api24以降
- ラインとかスラックであるような、通知上で返信する機能

## スタイル
- 通知ビューの見た目を変える機能でapi16から使える
- bigtextstyle  16
- bigpicturestylemediastyle
- decoratedmediacustomstyle

## RemoteViewによる通知のカスタマイズ
- セットコンテント
- リモートビューを作ってセットする

## Styleによる通知のカスタマイズ
- DecoratedCustomStyle
- DecoratedMediaCustomStyle
  - api24未満でも使える
- これもリモートビューを作ってセット

## Colorized
- 重要な通知のみ背景色設定のみ設定可能
- テキスト色は自動で決まる
- 実装は複雑

## 通知チャネル
- チャネルの順番はid文字列のソート順になる
- プライオリティとインポータンス
  - これは両方設定すること

## ベッドアップ通知
- 表示ロジックがバージョンごとに違う
- 重要度が高ければ表示される

## ロック画面通知
- API 21
- ロック画面に通知を表示
- 端末の設定次第
- VISIVILITY：プライベート
- setPublicVersion

## バンドル通知
- API 24
- 複数の通知をまとめて表示
- apiレベルの分岐が必要あり
- サマリー通知が必要
  - セットグループサマリー
  - セットグループ