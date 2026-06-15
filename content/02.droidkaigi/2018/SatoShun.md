---
title: DroidKaigi 2018 - なんとなく動いているProGuardから脱出するために / Sato Shun [JA] を視聴した
description: Droidkaigiの登壇「DroidKaigi 2018 - なんとなく動いているProGuardから脱出するために / Sato Shun [JA]」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-11T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=9tEhSocVIlU" }
::


## proguardはどれくらいコードを削除できる？
- 正しく設定すればクラスとメソッドは40%削減できる。

## proguardのしくみ
大きく5つのステップで処理される。

1. インプット
    - コードライブラリを入力。
2. シュリンク
    - 使ってないクラスメソッドを削除。
3. オプティマイズ
    - 最適化。
4. 難読化
5. プリディファイ

- シュリンクと難読化でハマる
- シリアライズ、デシリアライズライブラリは内部的にリフレクションを使っていてproguardと相性が悪い。

### シュリンク
設定したエントリポイントから参照されていないクラス、メソッド、メンバの削除。

### 難読化
クラスメソッドメンバのリネーム。

## dontwarn
警告を無視する。
依存関係をprovided指定しているものは最終的なjarには含まれない設定なので、無視してOK。

- なぜprovided？
- 人へのヒントでランタイム時に必要ない情報。

## -keepname
難読化対象から外す。クラスの相対パスを参照してたり、リフレクションなど。

難読化はクラスファイルには有効でもリソースファイルには影響しない。
同じパスとならないので、相対パスでアクセスできない。

## apk analyzer
apk の中身を分析するツール。
show bytecode で最終的な成果物を確認することができる。

## keepアノテーション
クラスやメソッドなどにつけるとproguardの対象から外すことができる。
proguardルールにKeepアノテーション向けのルールがデフォルトである。

## AAPT

Android ASSET Packaging toolの略。
ManifestやLayout XMLを参照し、ActivityやViewに対しては自動でkeepルールを作ってくれる。

但し例外あり。
例えば`app:actionViewClass`で指定したクラスはKeepルールを作ってくれない。

→`app:actionViewClass`は作ってくれるのに！！

こんなん無理やろ。
でも、思考停止に適当除外じゃなくて、どうすればいいかの調査方法をノウハウとして蓄積すべき。

## 解決するまでのステップ①

1. エラーログを確認。
2. Layoutxmlで参照しているクラスなのでaaptで問題がありそうと分かる。
3. AAPTが生成するaapt_rules.txtを確認する。
4. 該当のViewクラスのproguardルールが生成されていない。
5. 諦めて自分でproguardルールを追加する。

## 解決するまでのステップ②

1. エラーログから、該当のクラスが取得できていないことを確認
2. ASのApk Analyzer で class.dex を確認
3. SearchViewのコンストラクタが削除されていることがわかる
4. 必要なコンストラクタを削除しないようにproguardルールを追加