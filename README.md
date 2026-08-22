# mkt120.github.io

このリポジトリは、Nuxt 3 と Nuxt Content を使って構築した個人サイトです。
技術メモ、備忘録、開発ノートなどを Markdown で管理し、静的サイトとして公開する構成です。

## 概要

- Nuxt 3 ベースのサイト構築
- Markdown 記事を内容管理に使用
- GitHub Pages へ公開しやすい構成
- 日本語記事向けのレイアウトとメタ情報を含む

## 主なディレクトリ

- app/ : ページ、レイアウト、コンポーネント
- content/ : 記事コンテンツ
- public/ : 静的アセット
- server/ : サーバー関連コード

## 開発環境のセットアップ

依存関係をインストールします。

```bash
npm install
```

## 開発サーバーの起動

ローカル開発サーバーを起動します。

```bash
npm run dev
```

ブラウザで http://localhost:3000 を開いて確認できます。

## ビルド

本番用にビルドします。

```bash
npm run build
```

静的生成を行う場合は次のコマンドも利用できます。

```bash
npm run generate
```

## プレビュー

ビルド結果をローカルで確認します。

```bash
npm run preview
```

## 参考

- Nuxt: https://nuxt.com/
- Nuxt Content: https://content.nuxt.com/
