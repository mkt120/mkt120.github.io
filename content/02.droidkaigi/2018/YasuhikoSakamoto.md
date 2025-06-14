---
title: DroidKaigi 2018 - MVVMベストプラクティス / Yasuhiko Sakamoto [JA] を視聴した
description: Droidkaigiの登壇「DroidKaigi 2018 - MVVMベストプラクティス / Yasuhiko Sakamoto [JA]」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-11T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=PVZSG_2RGqI" }
::


## MVVMを実際にやってみると

- 随分と太ってしまったViewModel
- 密に関連してしまった複数のViewModel

## MVVMとは

- Model View ViewModel に分割するアーキテクチャパターン

## 具体例

### 太ってしまったViewModel

- 関心の分離を考える
- 適切な単位に分解・構成することで再利用性・保守性を高める
- では、MVVMにおける関心の分離とは？
- 各層で考える
- MVVMにおける関心の分離を各層ごとに考える

### Viewの関心

- データの見せ方
- レイアウト
- ユーザイベント

### Modelの関心

- View/VIewModel以外のプレゼンテーション層に依存しない情報
- ViewModel

## Viewの情報を抽象化して保持
- ModelとViewの橋渡し
- Androidにおける実践的な設計指針

### 一つの基準はViewModelのテスタビリティ。いい設計の指針になる。

- テストできないものが含まれていないか
- スレッド制御がないか
- 外部機能を直接操作していないか

## 各層のつながり

### ViewとViewModel

- イベントの通知⇔変更通知
- ViewModelはViewへの参照を持たない

#### 実践的な実装

- ラムダを使った記述でクリックイベントを通知
  - Viewに依存しなくなる
- ViewModelからViewへの変更通知
- ViewModelの変数をViewに公開
- Viewでそのまま使えない場合：カスタムセッターなどで対応
  - 例：ImageViewにおけるURLでの画像表示

### ViewModelとModel

- 状態変更を要求⇔変更通知
- ModelはViewModelへの参照を持たない

#### 実践的な実装

- ModelからViewModelへの変更通知。
  - 例えばRxJavaなどを利用。
- 例：SharedPreferenceなどをViewModelが直接参照
  - Repositoryパターンへ
  - Modelは状態を変更するだけ

## Android開発でよくある課題

### ダイアログや画面遷移

- 少なくてもViewModelの関心ごとではないので、あくまでトリガーを引くだけとする。
- 例：Navigator

### Context
- View/ViewModel/Modelそれぞれで必要な場所がある。
- ラッパーなどでViewModelでのみ使えるよう制限をかける

### RecyclerView

- RecyclerView.AdapterにデータバインディングでModelを渡す
  - カスタムセッターを用意
- `RecyclerView.Adapter#onBindViewHolder` で各アイテムごとにViewModelを生成
- 変更通知をどうやってViewに反映する？
  - `notifyDataSetChanged？`
  - 変更アニメーションできない。差分更新ができると嬉しい。
  - ObservableList：Androidのライブラリに同梱
  - 差分検知機能：何かしらのライブラリを使う

### 複雑なViewModelの関係が生まれてしまった
- データフローの単純化を考える
- 例：一覧要素が増減
- 親のViewModelにも反映が必要なパターン
- 親ViewModelにも関係性が生まれてフローが複雑に

### ViewとViewModelとの関係性を改めて考える

- 「Modelの状態変化に応じてViewModelが自動で変わる→Viewも自動で変わる」が実現できていれば、データの流れが単純になる
  - 例：Modelの変更通知を何度も受け取るように実装する
  - RxJava:Observableなど
