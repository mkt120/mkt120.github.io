---
title: DroidKaigi 2019 - Chrome Custom Tabs の仕組みから学ぶプロセス間通信 / OHMAE Ryosuke [JA] を視聴した
description: Droidkaigiの登壇「DroidKaigi 2019 - Chrome Custom Tabs の仕組みから学ぶプロセス間通信 / OHMAE Ryosuke [JA]」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-18T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=8yZYVzNmr_g" }
::

## プロセス間通信
- Intent
- AIDL
- ContentProvider
- その他:ソケット通信、ファイル共有など

### Chromeが使っている機能
- Intent
- AIDL（android　Interface　Definition　Language）

### プロトコルに対応したアプリを探す側
- PackageManager#queryIntentActivities
- PackageManager#queryIntentServices
- PackageManager#resolveActivity
- PackageManager#resolveService

### 探してもらう側
- AndroidManifestに記述
- ブラウザとして利用可能な設定を記述
- サービスのintent-filterには、CustomTabsの通信をするためのアクションを追加

## AIDL
- アプリ間でメソッドコールが可能
    - まるで自分のアプリかのように他アプリのメソッドがコールできる
    - 引数・戻り値共に使える
- データ型も柔軟
    - 比較的大きなデータも送受信可能
- バインド先プロセスが生きている必要がある
    - DeadObjectException
- スレッドセーフに実装する
    - アプリ間を跨いだメソッドコールはBinderスレッドで実行される
- 密結合にならないように
    - AIDLはアプリ間のインターフェースなので、両方のアプリを更新しないといけなくなる。

## Intent
- プリミティブ型、Parcelableはそのまま使える
- TransactionTooLargeException　大きなデータを渡すことができない
