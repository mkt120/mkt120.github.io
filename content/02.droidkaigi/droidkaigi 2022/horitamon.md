---
title: DroidKaigi 2022 - コルーチンを使って処理の見通しをよくする - リアルタイム放送の品質を向上し、保つために | horitamon [JA] を視聴した
description: Droidkaigiの登壇「DroidKaigi 2022 - コルーチンを使って処理の見通しをよくする - リアルタイム放送の品質を向上し、保つために | horitamon [JA]」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-18T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=ifogwcsjpQs" }
::

## よくある疑問：パッと見、何しているか分からんコード...
- コールバック in コールバック
- 呼び元のメソッドの役割が不明確
- LiveDataでUIへ処理完了を通知
- 見通しが悪いコード ⇒ 不具合の原因が分かりにくく、結果として解決に時間がかかる

## そこでコルーチンですよ
- コールバックが減らせるから見通しが良くなる。嬉しい。

## コルーチンとは
- 割愛

## コルーチンでいい感じに書き換えてみる
- コールバックの処理が同期処理っぽい書き方に書き換えられるので、階層（インデント）が減らせる。
    - 見通しが凄く良い。
- コールバックに結果がある場合も同期っぽく書き出せるので、同じく階層が減らせる

## 見通しが良くなったことで、コードの改善点も見つけやすくなる
- 並列実行を使って処理スピードアップ
