---
title: DroidKaigi 2022 - 実例から学ぶJetpack Composeのパフォーマンス改善 | Mori Atsushi [JA]を視聴した
description: Droidkaigiの登壇「DroidKaigi 2022 - 実例から学ぶJetpack Composeのパフォーマンス改善 | Mori Atsushi [JA]」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-18T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=_kIkc4IBLHI" }
::

## ゴール
- JetpackComposeで陥りやすいパフォーマンス低下を実例と共に理解・改善する

## パフォーマンス改善をするにあたり意識していること

### 早すぎる最適化を避ける
- コードの見通しが悪くなる
- 無駄なコストになりやすい
- 問題が発生したときに必要な対応を行う

### ボトルネックを探していく
- やみくもに直しても改善する可能性は低い
- ボトルネックを探して解消することが重要

## 解析手順

### 1. リリースビルドで確認する
- JetpackComposeではDebug／Releaseでパフォーマンスが大きく異なる
- 不要なコードを削除するR8コンパイラを利用する

### 2. 不要なRecomposeがないか確認する
- 値変化により不要な再描画処理が走っていないかを確認
- ログを出力すると確認しやすい

### 3. Profilerで詳細を確認する
- CallStackSampleRecording:何にどれだけ時間がかかっているか視覚的にわかる
- SystemTrackRecording:UIジャンクが発生しているか
- CompositionTracing

## 解決手順
- derivedStateOf :計算結果が変わるときだけ再描画処理が走る
- skippable
    - 入力がなければスキップする
    - すべての入力が安定しているか（条件がある）
    - 最初から意識しすぎるのは早すぎる
- stateの監視場所を変える