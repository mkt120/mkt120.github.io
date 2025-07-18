---
title: DroidKaigi 2021 - いかにしてアプリの起動時間を改善するか / haru067 [JA] を視聴した
description: Droidkaigiの登壇「DroidKaigi 2021 - いかにしてアプリの起動時間を改善するか / haru067 [JA]」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-18T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=8z0fKUcC110" }
::

## 起動時間とは
ランチャーアイコンタップ→すべてのコンテンツが表示されるまでの時間
- Aplication＃onCreate
- Activity初期化
- Activity onCreate
- その他

ただしこれらすべてが実行されるとは限らない

## 起動パターンは3つ

- cold start：まっさら状態からの起動
- warm start：部分的な起動（バックキーで戻ってからの再起動）
- hot start：レジューム復帰

## Android Vitalでの基準時間
これより時間がかかると遅い

- Cold start：５秒
- warm start：2秒
- hot start：1秒

cold startから改善するとよい。

## 起動スピードを改善するために

### まずは計測
- ボトルネックがどこかを調べる
- 修正コストと得られる効果（退避用効果）
- そもそも認識していないボトルネックの見える化

#### Releaseビルドで計測すること
- Debugビルドはデバッグ用の処理が含まれているので、計測に適していない。

### 計測手順
大きく３つ

- 眺める：起動処理の分割と問題個所の目星をつける
    - MacroBenchmark logcat
- 特定する:怪しい箇所をコードレベルで特定・改善
    - CPU Profiler
- 確認する：問題が改善されているか確認

## MacroBenchmarkによる計測
- テストを実行する形で起動時間を計測できる

cold/warm/hot startの計測
繰り返しの実行やその中央値の計測
テスト結果をトレースファイルとして出力
（実行するためのデモあり）

## logcatによる計測
ActivityTaskManager が logcat に起動時間を出力している

- 最初の描画までにかかった時間（Displayed Time）
    - I/ActivityTaskManager: Displayed (packagename.activityName) xxx ms 
- Activity.reportFullyDrawn() が呼ばれるまでの時間
    - I/ActivityTaskManager: Fully drawn (packagename.activityName) xxx ms 
- Activity.reportFullyDrawn() は手動で呼んであげる
    - つまり：自分で計測範囲をカスタマイズできる

### 時間の計り方

- currentTimeMillisは使わない
    - 時計の値なので、ユーザやネットワークから時計が更新されると値が急激に変化する可能性あり
- SystemClock.updateTimeを使う

### 起動開始地点

- より厳密に計測するなら、Application の companion object で取得
- content provider などが実行されるケースを加味

### CPU Profiler による特定

起動時間を計測するため工夫が必要

- Run -> EditConfiguration 
- Profiling > start this recoding on startup CPUactivity sample javamethod 

#### コードからも実行できる

- Debug.startMethodTracingSampling()／Debug.stopMethodTracing()
    - 計測の自動化
    - 特定の開始・終了の記録

（計測調査デモあり）

## 修正作業
- キャッシュ
- 並列化・平行化
- 不要な処理の削除・遅延

## 確認する
手元では再現しないパターン

- APIリクエストとの兼ね合い
- 特定地域・回線
- 特定デバイス
- 普段は早いけど、たまに遅い

## 実際の運用を考えるなら「遅くしない」ことを意識する必要がある
### 監視が必要
- 機能追加を繰り返す過程で起動時間は知らないうちに遅くなる
- ログをとるだけではだめ。それを活用してはじめて意味がある。

### 監視するためには
- フローとして組み込む
    - リリース時の確認項目や定例
- 目につくところに流す
    - アラートを鳴らす、Slackに流す
    - XXXを見てねは大体見ない
- わかりやすく流す
    - 必要な情報だけをシンプルに

## 効果
- どこかのタイミングで起動が遅くなっていることに検知できた