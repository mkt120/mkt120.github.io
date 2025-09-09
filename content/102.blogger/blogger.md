---
title: Blogger に関するTips
description: Blogger に関するTipsを紹介します。
navigation: true
draft: false
date: 2025-09-08T07:00:00+09:00
---

## Bloggerで自分のアクセスを追跡させない

1.  以下のコードをコピーする。日付は適当な未来の日付でOK。

    ```javascript
    document.cookie = "_ns=2; expires=Tue, 19 Jan 2038 03:14:07 GMT; path=/";
    ```

2.  Bloggerのブログページで**F12キー**を押し、デベロッパーツールを開く。

3.  デベロッパーツール内の**Console**タブをクリックする。

4. 1.でコピーしたコードをコンソールに貼り付けて実行。

### 参考

  * [Blogger 「自分のビューを追跡しない」が機能しない（保存されない）原因と対策](https://nkurilog.blogspot.com/2017/11/blogger_28.html)
  

## Bloggerにシンタックスハイライトを設定する

`highlight.js`を使ったシンタックスハイライトの設定方法を紹介。

### Bloggerの`head`にコード追加

`highlight.js`の[Getting Started](https://github.com/highlightjs/highlight.js/#getting-started)ページを参考に、以下のコードをBloggerのHTML編集画面にある`<head>`タグ内に貼り付ける。

```html
<link href='//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/default.min.css' rel='stylesheet' />
<style>code{font-family:Menlo,Consolas,Courier,monospace;color:#333;background:#f8f8f8};</style>
<style>kbd{padding:.1em .6em;border:1px solid rgba(63,63,63,0.25);-webkit-box-shadow:0 1px 0 rgba(63,63,63,0.25);box-shadow:0 1px 0 rgba(63,63,63,0.25);font-size:.7em;font-family:sans-serif;background-color:#fff;color:#333;border-radius:3px;display:inline-block;margin:0 .1em;white-space:nowrap}</style>
<script src='//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/languages/awk.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/languages/erlang.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/languages/erlang-repl.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/languages/go.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/languages/ldif.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/languages/scheme.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/languages/yaml.min.js'></script>
<script>hljs.initHighlightingOnLoad();</script>
```

`link`, `script`は開始タグと終了タグ（`<link ...></link>`）を両方記述しないと正しく動作しない場合がある。

### 記事内にコードを記述する

シンタックスハイライトを適用したいコードは、`pre`タグと`code`タグで囲んで記述する

```xml
<pre><code>
...ここにコードを記載...
</code></pre>
```

ここまでの設定で一度表示を確認し、シンタックスハイライトが機能しているか確認する。

### スタイルを変更する

`highlight.js`では、CSSファイルを変えるだけで簡単にコードのスタイル（テーマ）を変更できる。

`default.min.css`の部分を変更する。

```
default.min.css
```

`highlight.js`の[デモページ](https://highlightjs.org/static/demo/)や[GitHubのスタイル一覧](https://github.com/highlightjs/highlight.js/tree/master/src/styles)を参考に、好みのスタイルを設定する。
例えば、`dracula`テーマを使いたい場合は、以下。

```
dracula.min.css
```

※`dracula.css`ではなく、`.min.css`を指定する必要がある。

### 参考

  * [Bloggerで技術ブログを書くためのカスタマイズ](https://www.smartbowwow.com/2019/02/blogger.html)
  * [Highlight.js](https://highlightjs.org/)