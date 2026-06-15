---
title: DroidKaigi 2020 - 1から学ぶAndroidアプリデバッグ - アプリの動作を追いかけよう / Yoshihiro Wada [JA] を視聴した
description: Droidkaigiの登壇「DroidKaigi 2020 - 1から学ぶAndroidアプリデバッグ - アプリの動作を追いかけよう / Yoshihiro Wada [JA]」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-16T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=udIqZERznkY" }
::

Android アプリのなぜ？の効率化にしたい

## デバッグ対象はさまざま
- UI
- ロジック
- API／DB
- その他

## Android Studioのデバッグ機能

### Logcat
- ログ閲覧機能。
- ６つのログレベルがある。（VERBOSE～ASSERT）
- 出力フォーマットは以下。
    - [DATE] [PID] [TID] [package] [loglebel] [tag] [message]　

### Breakpoint
- 変数などの状態を確認できる
- アプリへのアタッチで確認できる
- debuggable true の設定が必要
- 命令Breakpoint 
    - 処理する直前で止まる
- 変数Breakpoint
    - 変数が操作されるときに止まる
    - タイミング（初期化／参照／編集）を指定できる

### Layout Inspector
- スクショを取得してレイアウト状態を検証できる
- Viewの階層情報＋スクショ（レイアウト境界付き）＋対象のパラメータ
- 特にAndroidStudio 4.0 から Live Layout Inspector に
    - API29 以上で、設定の有効化が必要
- 3DView 
    - 階層を3D化したもので前後関係が視覚化しやすくなった

### AndroidProfiler
- CPU／メモリ／ネットワーク／バッテリーの使用状況を把握できる
- キー入力
- CPUProfiler
    - CPUの使用率やスレッドの使用率
- MemoryProfiler
    - アプリがどれだけもメモリを占有しているか確認できる
    - 選択クラスのインスタンス一覧
- NetworkProfiler
    - 通信を検知、送受信されたデータなどの確認
- EnergyProfiler(Android8.0以上)
    - CPU／Wifi／GPU／センサーなどでのエネルギー消費を表示する
    - システムイベントを発見できる

### その他周辺ツールやライブラリ
- Timber
- Stetho
- Flipper
    - （Stethoのアプリ版）iOSにも対応
- LeakCanary
    - リークした参照を表示してくれる
- HyperionAndroid：アプリ上にデバッグメニューを追加できる
    - 実機上でレイアウト状態を確認できる
    - クラッシュログを確認できる

## デバッグ手法の提案
こうやるといい感じにデバッグできるよ

### アプリからログを取得
- Logcat（Timber）／BreakPoint
- Timberではログの際の挙動を変えられる

### API通信の検証
- NetworkProfiler
    - 特に、リクエストをクリックするとその詳細を確認できる
- Stetho／Flipper
    - 通信を拾えるようにする実装が必要
- NetworkInspector
    - 起動中に発生した通信を確認できる（前項と同じことができる

### データベースの内容を検証する
- Stetho／Flippter

### 画面レイアウト
- LayoutInspector
- Stetho／Flitter
- Hyperion-Android

### 便利なBreakPointの使い方
- Exception
    - Exceptionの発生時に止める（なんでも／指定）
- Condition
    - 条件を満たしたときのみ