---
title: 【視聴備忘録】Android CI 2016 edition by Yusuke Yagyu at DroidKaigi 2016
description: Droidkaigiの登壇「Android CI 2016 edition by Yusuke Yagyu at DroidKaigi 2016」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-11T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=d5AhlBIy_pI" }
::


## 自動テスト/CIどこを取り、どこを捨てるか

- 技術的制約
- 人的リソース
- 時間的制約
- 予算制約


## テストの種類と自動テストの対応付け

- 単体テスト：UnitTest、一部のInstrumentation Test
- 結合テスト：ほとんどのInstrumentation Test
- システム・受け入れテスト：End-to-end Test
- 探索的テスト：手動 バグを見つけるためのテスト

## Robolectric

- UnitTest用のAndroidSDK。
- AndroidSDK依存コードをUnitTest可能にする。
- 部分的には有用だが、端末結合度の高いAPIは脆い。
- SQLiteとかストレージとか。


## Mockito
- UnitTest, Instrumentation Testで使えるモックライブラリ。
- spy,stubの違いに注意。
- spy：呼び出された回数や引数。
- stub：返り値のスタブ化。


## Espresso

- Instrumentation Testの高レベルラッパ。
- 非同期なActivityのテストを同期的にかけるらしい。


## UI Automator

- E2E Testツール。


## テスト自動化セオリー

- 実行速度は 単体 > 結合 > 受入。
  - なのでテストケースの数も単体＞結合＞受入 となっていることが望ましい。
- 稼働中アプリの場合と新規開発の場合で方針が変わる。
  - 稼働中ならInstrumentation Test、 E2Eテストで稼働を担保しながらリファクタリング。
  - 新規開発であればComponentとロジックを切り離し、UnitTestを手厚く。


## どこまでテストを書く？

- 仮にカバレッジ100%でも想定漏れが発生する。
- E2Eテストで成功パターン以外のテストケースを書くのは難しい。
- 「安心するまでテストを書く」がひとつの目安。
  - E2Eだけ書いて「動くことだけ」は担保するのも１つの手になる。


## CIを前提としたテストを書く

- テスト前後で端末の状態が変わらないことを担保する。
- エミュレータの破棄、端末をワイプするなど。
- 単体＞結合＞受け入れのケース数セオリーを守らないと、実行時間の爆発的増加につながる。


# プランニング戦術
- Jenkinsメンテができる人的リソースが確保できればJenkins。
- 人的リソースが無理でも予算があるならコンテナベースCIなど(CircleCIとか)。


## 重要なこと

- 全員が自動テストの重要さを理解すること。
- 全員がテストコードを書ける。
- テストコードを書くのが難しい部分を切り分けられる「テストに強いエンジニア」がいると良い。
- CIをすることで自動テストの習慣化、品質を下げないことをチームのメンバで合意する。
 