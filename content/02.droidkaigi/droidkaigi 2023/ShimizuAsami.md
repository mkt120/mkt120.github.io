---
title: DroidKaigi 2023 - [JA] モニタリングでパフォーマンス改善入門 | ShimizuAsami を視聴した
description: Droidkaigiの登壇「DroidKaigi 2023 - [JA] モニタリングでパフォーマンス改善入門 | ShimizuAsami」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-18T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=dofoRdSgV9w" }
::

## こんな経験ありませんか？
- 起動が遅い
- 動作が重い、Viewがカクつく
- バッテリー消費やばくね？

## 何をすればいいの？
- 公式ドキュメントを読もう
- 以降はここに書いてあることの紹介
- 問題の認識⇒原因の調査／検査⇒改善をループさせる
- 改善は1つずつ

## キーワードの説明
- ジャンク：レンダリングが遅すぎてフリームがスキップされること。
- フリーズ・ANRもジャンクの一種
- フリーズ：レンダリングに700ミリ秒かかるUIフレーム。
- ANR：UIスレッドが長時間ブロックされて起こる通知。（5秒以上）

## パフォーマンスの検査は3パターン
- 受け身検査
- 手動検査
- 自動テスト

### パフォーマンスの検査における前提：
- できる限り本番の環境で。
- 実機で
    - debuggable=false 

## 受け身検査
- アプリを動かしながらログキャット見ること。
- 何が起きているかわかるけど、どこで起こっているかの詳細はわからない

- 例：TAG:Choreographer: Frameのskip時に挙がるログ
- 例：TAG:ActivityManager: ANRが発生しているログ
    - タイムアウトの理由が表示される
    - 原因・どのタイミングで起きているかが分かる
- 例：TAG:ActivityTaskManager: Activityの起動時間が分かる
- 例：TAG:OpenGLRender: mainThreadが700ms 以上遅れる（＝フリーズが発生したら）

## 手動検査
- 問題のデバッグをすること
- 問題がいつどこで発生するかを確認する
- SystemTraceファイル化することで、情報をグラフィカルに表示可能

## ツール
- Android9以上：Perfetto
- AndroidStudioのProfiler

### ツールを使う上で
- debbuggable or profileable なアプリで実行可能。
- profilable：ApplicationManifest>Application直下に定義。
    - 本番アプリには適用しないこと

### Perfetto
- 自分のアプリだけでなく、端末全体のプロセスを確認可能。
- SystemTraceをこのページに読み込ませると、いろいろ詳細情報を確認可能。
- 例：AndroidAppStartUpを見ると、アプリ起動されたことが分かる
- カスタムログ（カスタムイベント）を追加可能。
- Trace.beginSection/Trace.endSection

### AndroidStudioのProfiler
- Android5.0以上で利用可能。
- adbで接続している場合にオンタイムで確認可能。
- ただし対象アプリのProcessのみ。

### どちらを使うべき？
- AndroidStudioのProfilerは手軽に利用可能。
- 一方で、Perfettoの方が詳細情報の確認可能。

### SystemTrace化について
- SystemTraceは開発者向けオプションから設定。
- システムトレース＞トレースの記録orトレース記録のクイックタイル表示。
- 端末内に保存されるのでPCで確認。

## 自動テスト

パフォーマンスのスピードを集計する

### Macrobenchmark
- 起動・複雑な操作などの比較的大きな領域に対応するテスト
- API23／AGP7.3.0／GradleVersion7.4

### Microbenchmark
- 1メソッドなどの小さい領域に対するテスト
- API14

## パフォーマンスのモニタリング

- 継続的なパフォーマンスの監視をすることで、問題の早期発見につなげる。

### Android Vitals
- PlayConsoleで確認可能。
- 品質情報の老具がPlayにより自動収集される。
- ANR率／クラッシュ率
- Crashlyticsよりも収集できる情報が多い
- 品質が悪いと、そのアプリがユーザに見つかりにくくなる...

### Firebase Performance Monitoring
SDK入れると自動計測される

- HTTPネットワーク
- アプリ起動時間
- レンダリング情報

### JankStats
- フレームの統計情報に関するレポート
- Windowオブジェクトの監視⇒一定間隔で通知
    - フレーム開始時間
    - 持続時間
    - ジャンクかどうか

### Benchmarkの継続的インテグレーション
- サンプルみましょう。