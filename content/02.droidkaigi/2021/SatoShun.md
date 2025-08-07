---
title: DroidKaigi 2021 - Master of Lifecycle / Sato Shun [JA] を視聴した
description: Droidkaigiの登壇「DroidKaigi 2021 - Master of Lifecycle / Sato Shun [JA]」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-18T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=C6HeJzqJqRI" }
::


- Lifecycleの話かと思ったらLifeCycle,ViewModel,LiveDataの話だった。
- androidx.lifecycle.Lifecycleを利用することで、ライフサイクルに従った良い感じの実装が実現できる。

## ライフサイクルに従ったライフサイクルの更新

＝UIの更新に必要なデータ非同期に取得し、取得したデータをUIに反映する。

- 常に最新のデータに保ちたい。
- 非同期に処理したい。
- 画面が非アクティブの時にUIは更新したくない。
- 画面回転などでActivityが再生成されてもデータを保持したい。

## ViewModelモデルの利用
- Activityが再生成されてもデータ保持することができる。
- ただし、プロセスデスに対しては、SaveInstanceStateを使う必要あり。
- SaveStateHandleクラスを利用することで効率的に復帰できる。

## LiveData／LifeDataビルダー
### LiveData
- 値が変わるとライフサイクルに応じてUIに通知する。
- アクティブの時に通知される。
- 非アクティブの時には通知しない。
- Fragmentの時は、viewLifecycleOwnerを使う。

### LiveDataビルダーの利用
- コルーチンによる情報取得
- 指定時間非アクティブの時は処理を終了する。

## Flowの利用／Flowビルダー
- LiveDataより、より汎用的に作られているもの。
- 例えば、ライフサイクルに準拠していないため非アクティブの時でも、データの更新が行われたりとか。回避メソッドなどがあり（launchWhenXXX..)

