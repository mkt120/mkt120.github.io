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

## テーブルを内部結合する (INNER JOIN)

内部結合は、**結合条件に合致するレコードのみ**を結果として出力する。

```sql
SELECT * FROM table_a INNER JOIN table_b ON table_a.id = table_b.id
```

## テーブルを外部結合する (OUTER JOIN)

外部結合は、結合条件に合致しないレコードも`NULL`として出力する結合方法。
すべてのデータを一覧として表示したい場合などに使われる。

```sql
SELECT * FROM table_a LEFT JOIN table_b ON table_a.id = table_b.id
```

上記の例は**左外部結合**（`LEFT JOIN`または`LEFT OUTER JOIN`）。
結合の基準となる左側のテーブル（`table_a`）のすべてのレコードが結果に含まれ、
右側のテーブル（`table_b`）に対応するレコードがない場合は`NULL`が返される。

外部結合には**右外部結合**（`RIGHT JOIN`）もありますが、基本的には`LEFT JOIN`を使用すれば、テーブルの順番を入れ替えることで同じ結果が得られる。


## テーブルに新しいカラムを追加する

`ALTER TABLE`文を使う。

### サンプル1: シンプルなALTER文

`テーブル名`、`カラム名`、`型`を適切な値に置き換えて使用します。

```sql
alter table テーブル名 add column カラム名 型;
```

### サンプル2: デフォルト値付き

新しいカラムにデフォルト値を設定したい場合は、`DEFAULT`節を追加します。

```sql
alter table テーブル名 add column カラム名 型 default 初期値;
```

**例:** `user`テーブルに`age`カラムを`INT`型で追加し、デフォルト値を`18`に設定する場合

```sql
alter table user add column age int default 18;
```

### 参考

  * [ど素人のAndroidアプリ開発入門 - カラムの追加](http://androidhacker.blog94.fc2.com/blog-entry-63.html)
  

## SQL上でビット演算する

SQLで利用可能なビット演算子は以下。

#### **論理積 (AND)**

`&`を使って、2つの値のビットごとの論理積を計算できる。

```sql
-- 1 & 1 -> 1
select 1 & 1;

-- 1 & 0 -> 0
select 1 & 0;
```

#### **論理和 (OR)**

`|`を使って、2つの値のビットごとの論理和を計算できる。

```sql
-- 1 | 1 -> 1
select 1 | 1;

-- 1 | 0 -> 1
select 1 | 0;

-- 0 | 0 -> 0
select 0 | 0;
```

#### **反転 (NOT)**

`~`を使って、値のすべてのビットを反転する。

```sql
-- ~0 -> -1
select ~0;

-- ~1 -> 0
select ~1;
```

#### **左シフト (LEFT SHIFT)**

`<<`を使って、指定したビット数だけ左にシフトする。

```sql
-- 1 << 2 -> 4 (2進数の01が100になる)
select 1 << 2;
```

#### **右シフト (RIGHT SHIFT)**

`>>`を使って、指定したビット数だけ右にシフトする。

```sql
-- 4 >> 1 -> 2 (2進数の100が10になる)
select 4 >> 1;
```