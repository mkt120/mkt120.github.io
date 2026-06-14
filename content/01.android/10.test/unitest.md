
---
title: Unit Test
description: Android における Test について解説
navigation: true
draft: false
date: 2026-06-11T07:00:00+09:00
---


## テストコードの重要性

テストコードとは、実機やエミュレータに開発段階のアプリを手動でインストールすることなく、プログラムによって自動で動作検証を行うための仕組みです。テストコードを書かなくてもアプリの開発・リリース自体は可能であるため、まずは複雑な機能実装やドメインロジックのコーディングスキルを優先して習得するというロードマップも一つの考え方です。

しかし、昨今のCI/CD（継続的インテグレーション／継続的デリバリー）の普及に伴い、テストコードを適切に実装できるエンジニアの需要は非常に高まっています。自動テストのスキルを身につけることで、リファクタリング（コードの改善）が容易になり、より堅牢で品質の高いアプリケーション開発が可能になります。

## テストコードの種類

Androidの開発においては、テストコードを実行環境の違いによって大きく2種類に分類できます。

### 1. ユニットテスト（ローカル単体テスト）

開発用PC（JVM上）で実行されるテストコードです。Android OSの機能に依存しないビジネスロジックや、純粋なKotlin/Javaのプログラムに対する検証を行います。実機やエミュレータを起動しないため、後述のインストルメントテストに比べて**非常に高速に実行できる**というメリットがあります。

### 2. インストルメントテスト

実機やエミュレータ上で実行されるテストコードです。Androidのコンテキスト（Context）やUI要素、アクティビティのライフサイクル、外部機能との連携など、OS依存の処理を検証します。より現実に近い環境でユーザーの操作に基づいたテスト（UIテストなど）が行える反面、ビルドやアプリの転送・インストールが発生するため、**実行時間が比較的長くなる**というデメリットがあります。

## ユニットテストを実装する

ユニットテストの実装手順は以下の通りです。

### 1. ライブラリの準備

ユニットテストを実行するには、`build.gradle.kts`（または `build.gradle`）の `dependencies` ブロックにテスト用ライブラリを追加する必要があります。
プロジェクトの新規作成時にAndroid Studioによって自動で追加されているケースも多いため、確認してください。

```kotlin
dependencies {
    // ユニットテスト用のJUnit4ライブラリ
    testImplementation("junit:junit:4.13.2")
}

```

### 2. テスト対象のコード

今回は、以下の仕様を持つシンプルなクラスとメソッドをテスト対象とします。

```kotlin
class Sample {
    fun test(input: Int?): Boolean {
        if (input == null) {
            throw IllegalArgumentException()
        }
        return input > 0
    }
}

```

このメソッドには、以下の3つのテスト観点が存在します。

* `input` に `1` 以上の値が渡されたとき、 `true` が返されること(正常系)
* `input` に `0` 以下の値が渡されたとき、 `false` が返されること(正常系)
* `input` に `null` が渡されたとき、 `IllegalArgumentException` がスローされること(異常系)

### 3. テストクラスの追加

テストコードを記述するためのテストクラスを作成します。
Android Studioの機能を利用すると簡単です。テスト対象のクラス名（`Sample`）にカーソルを合わせ、`Option` + `Enter`（Windowsの場合は `Alt` + `Enter`）を押し、メニューから **Create Test** を選択します。

生成された `SampleTest` クラスは、プロジェクト構造の `src/test/java/`（または `src/test/kotlin/`）配下に配置されます。

```kotlin
class SampleTest {
    // ここにテストメソッドを追加していきます
}

```

### 4. テストメソッドの実装

それぞれの観点に対応するテストメソッドを実装します。
各テストメソッドには `@Test` アノテーションを付与する必要があります。

#### 正常系：trueが返される検証

入力値に `1` を指定した際、戻り値が `true` になることを `Assert.assertEquals` を使用して検証します。

```kotlin
@Test
fun testTrue() {
    val sample = Sample()
    val value = sample.test(1)
    Assert.assertEquals(true, value) // 第一引数に期待値(Expected)、第二引数に実際の値(Actual)を指定
}

```

#### 正常系：falseが返される検証

入力値に `0` を指定した際、戻り値が `false` になることを検証します。

```kotlin
@Test
fun testFalse() {
    val sample = Sample()
    val value = sample.test(0)
    Assert.assertEquals(false, value)
}

```

#### 異常系：例外がスローされる検証

引数に `null` を渡した際に、意図した例外が投げられるかを検証します。例外の発生を検証する場合は、`@Test` アノテーションの引数に `expected` パラメータを指定します。また、万が一例外が発生せずに処理が通過してしまった場合のために、直後に `Assert.fail()` を配置して明示的にテストを失敗させます。

```kotlin
@Test(expected = IllegalArgumentException::class)
fun testException() {
    val sample = Sample()
    sample.test(null) // ここで例外が発生すればテストは成功する
    Assert.fail("例外が発生しませんでした")
}

```

## ユニットテストにおける制限と解決策（Robolectric）

一般的なユニットテストは開発PCのJVM上で実行されるため、**Android SDK（`Context` や `Bundle`、`Fragment` など）に依存するコードをそのままテストするとエラー（RuntimeStubExceptionなど）が発生する**という制限があります。

この制限を解決する方法は主に2つあります。

### 1. インストルメントテストに移行する

実機やエミュレータを利用してAndroid環境そのものでテストを行います。

### 2. Robolectricフレームワークを採用する

`Robolectric` を導入すると、PCのJVM上にAndroid環境の影（Shadow）をシミュレートできるようになります。これにより、実機を使わずにユニットテストの速度のまま、Android SDKに依存したコード（例：`Bundle` のデータ格納確認など）をテストすることが可能になります。

* [Robolectric 公式サイト（英語）](https://robolectric.org/)

### 参考

* [ローカル単体テストを作成する | Android Developers](https://developer.android.com/training/testing/local-tests?hl=ja)