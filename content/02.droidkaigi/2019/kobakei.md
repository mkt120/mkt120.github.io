---
title: DroidKaigi 2019 - 今日から始める依存性の注入 / kobakei [JA] を視聴した
description: Droidkaigiの登壇「DroidKaigi 2019 - 今日から始める依存性の注入 / kobakei [JA]」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-17T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/" }
::

## DI
- コンポーネント間の依存関係を排除し、外部から依存コンポーネントを注入させるデザインパターン。
- コンポーネントが疎結合になる。

## DIのメリット
- アプリケーションの拡張性。
- テストが書きやすい。

## 大まかな実装方針
- Containerオブジェクトを用意し、Presenterを返すメソッドを用意。
- Activityはそのメソッドを使ってPresenterを取得するだけ。
 
## でも気持ち的には
- PresenterとActivityは同じライフサイクルであってほしい。
- Activityのインスタンスが2つあるなら、Presenterも2つインスタンスがあってほしい。
 
## スコープ
- 依存オブジェクトの生存期間。例えば、Singleton、Activityと同じ生存期間、など。
- DIではスコープごとに依存オブジェクトが生成され、使いまわされる仕組みが必要。
- たとえば、PresenterはActivityScope、RepositoryはSingletonなど。
 
## スコープを意識した実装方針
- Containerオブジェクトはシングルトンをスコープとするクラスだけを用意。
- Repositoryはここから取得。
- ActivityScopeとするオブジェクトはそれに対応するActivityContainerクラスを用意。
- Activity側でActivityContainerクラスのインスタンス生成。
- そのインスタンスからPresenterを取得。
 
## DIコンテナ
- DIに必要なContainerなどのクラスを自動で生成してくれるライブラリ。
- Dagger2
- Koin
 
### Dagger2
- 依存関係に問題があればコンパイル時にエラーを吐く。
- アノテーションを使えば依存関係の解決するコードを自動生成。
- ビルドが遅くなる。
- ドキュメントが難しい。
 
### Koin
- ビルド速度に影響なし。
- ドキュメントがわかりやすい。
- 実行するまで依存関係に問題があるか分からない。

## 所感
- Dagger2とKoinの実装サンプルをざっくり解説してくれているので、いざ使うときにはこれを見れば簡単に導入できそう。 