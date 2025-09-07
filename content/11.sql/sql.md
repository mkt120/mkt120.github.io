---
title: SQLを扱う
description: SQLに関するTIPSを紹介します。 
navigation: true
draft: false
date: 2025-09-08T07:00:00+09:00
---

## 単一のキーをPRIMARY KEYに設定する

テーブルを作成する際に、主キーにしたいカラム名の直後に`PRIMARY KEY`と指定する。

```sql
create table user(id int primary key, name text);
```

## 複数のキーをPRIMARY KEYに設定する

複数のカラムを組み合わせて主キーにする場合（**複合主キー**）は、単一のキーの場合とは書き方が異なり、テーブル定義の最後に`PRIMARY KEY`節を追加する。
括弧内に主キーに設定したいカラム名をカンマ区切りで記述します。例えば、`id`と`subId`を主キーに設定する場合は以下。

```sql
create table user(id int, subId int, value text, ..., PRIMARY KEY(id, subId));
```