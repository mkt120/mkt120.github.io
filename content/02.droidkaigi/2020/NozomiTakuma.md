---
title: DroidKaigi 2020 - 自動生成でさくさく実装するユニットテスト / Nozomi Takuma [JA] を視聴した
description: Droidkaigiの登壇「DroidKaigi 2020 - 自動生成でさくさく実装するユニットテスト / Nozomi Takuma [JA] を視聴した」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-16T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=OHKCD9-uYLc" }
::

以下の機能を使って、テストコードを簡単に実装しよう！の会

- Live Template
- File Template
- Postfix Completion

## Live Template

スニペット。キーワードを入力すると、自動で色々入力される。

## File Template

ファイル作成時のテンプレート。

## Postfix Completion

".キーワード"の形式で入力すると、対応するテンプレートに変換してくれる。

## パラメタライズテストもサクサク作りたい
- プラグインがあるのでそれを使うと簡単にできる
- Dynamicテスト,junitで実装されてるやつを使うわけじゃなさそう…？パラメタライズテストのアノテーションもあるけど、Dynamicテストはクラス内に必要な情報をカプセルできるらしい。
- プラグインがあるのは嬉しいけど、標準であるのだからそちらを使いたいなぁ。

## 所感
- テンプレートはエクスポート、インポートもできるからみんなで共有もできるのは便利。
- そもそもテストコードに限らず、テンプレートの機能は便利だから通常の実装でも活かしていくのが吉。


