以下のテンプレートに沿って、`content/` 配下に備忘録ページを新規作成または更新してください。必要な情報を補って依頼してください。

---
必須項目
- action: create または update
- title: ページタイトル
- description: 短い説明（1行程度）
- category: カテゴリ名（ディレクトリ名、例: 999.other）
- tags: カンマ区切りまたは配列（例: docker,optimization）
- draft: true/false
- date: 作成日（省略可：今日の日付を使用）
- slug: 任意（省略時はタイトルから推測）

推奨項目
- summary: 概要（最初のセクション）
- background: 背景や目的
- steps: 実施手順（箇条書き）
- code: コードスニペット（言語指定可）
- result: 結果・所感
- references: 参考リンク（配列）

例（YAML風）
```
action: create
title: Docker イメージの軽量化メモ
description: Docker イメージを小さくするために試したこと
category: 999.other
tags: [docker,optimization]
draft: true
date: 2026-05-15
slug: docker-image-optimizations
summary: Docker イメージ削減のために試したことの備忘録
background:
  - デプロイ先の容量制限への対応
steps:
  - ベースイメージを alpine に変更
  - マルチステージビルドを採用
code: |
  ```dockerfile
  FROM node:18-alpine AS builder
  ...
  ```
result: イメージが約200MBから80MBに減少
references:
  - https://docs.docker.com/develop/develop-images/multistage-build/
```

依頼方法: このファイルの内容をそのままコピペして、必要な値を埋めてください。私（アシスタント）は `content/` 配下に Markdown ファイルを作成または更新します。