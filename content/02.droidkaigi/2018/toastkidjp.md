---
title: DroidKaigi 2018 - Android アプリの中を覗いてみよう / toastkidjp [JA] を視聴した
description: Droidkaigiの登壇「DroidKaigi 2018 - Android アプリの中を覗いてみよう / toastkidjp [JA]」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-18T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=0g2awN1CNuU" }
::

**【注意】すべて自己責任**

## アプリを使っていて
- どういう実装になっている？
- 使っているWebAPIは？
- なんでこのアプリ80MBもサイズあるの！？

## まずはAPKを解析し始めるまでの手順
- 解析したいAPK
    - ミラーサイトから入手
    - 端末から入手
        - APK Extractor を使って入手可能
- Android Studio
    - Build > Analyze APK
- APK Toolでも実行可能

## ソースコードを見る
1. apkの拡張子をzipに書き換える
2. unzipする
3. .dexファイルをdex2jarでjarに変換
4. 生成されたjarをJD-GUIで除く

## 覗かれる前提で作る
- センシティブな情報はアプリ内ではなく、クラウド上に
- 会社の重要なビジネスロジック・情報はWebサービスかネイティブライブラリ内に
- WebAPIへのアクセスは極力プロキシ経由で
- 強力な難読化
