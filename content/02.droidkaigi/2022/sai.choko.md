---
title: DroidKaigi 2022 - マンガアプリのメモリ改善とメモリ解析方法 | sai.choko [JA] を視聴した
description: Droidkaigiの登壇「DroidKaigi 2022 - マンガアプリのメモリ改善とメモリ解析方法 | sai.choko [JA]」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-17T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=eZtPnblY-qA" }
::


## 目的

- Java/Andメモリ基礎知識
- メモリ解析ノウハウ
- Best Prctice

## 解析方法
- クラッシュログ
    - 最終的な結果しかわからない。
- JavaJVM
    - 参照と深さ
    - Heap size(-Xms, -Xmx, largeHeap)
- AndroidStudioのメモリprofiler
- メモリ監視スレッド
- Bitmapのメモリ計算方法

## OOM
- Androidd5,6,7 で発生しやすい
- Ram2G,3Gで発生しやすい
- Android8 以上では発生しにくい（メモリ管理の改善が入った）

## メモリ解析ツール
- Memory Profiler を使った解析デモ
    - dumpを取って、メモリの内訳を確認
    - どのBitmapがメモリを食っているのか調べる
- MemoryUtil
- Leak canary

## 画像サイズ調整
- JPG画像が1MBなのに、Android bitmap サイズが12MBなんだがどういうこと？
- JPG/PNG/webP は圧縮アルゴリズム。
- 実際に使われるときはBitmapとして展開されるから。
    - たとえばARGB_8888 方式:各ピクセルには 4 bytes 
    - なので、 2048 x 1536 x 4 = 約12MB
- オリジナル画像をロードしない
    - 30 x 30 程度のImageViewに500x500の画像がサーバから送られてこない？
    - inSampleSize
    - 画像分割ロード

## 画像ロード量調整
- RecyclerViewのfastscroll対応
    - fast scroll で画面上にロードしないように制御
    - holder.getAbsoluteAdapterPosition() から NO_POSITION が返されたら、fast scroll されているのでもはやロード不要。

## メモリ参照をなくす

### Picasso
- memorycache で 15% heap メモリを占有する。
- Picasso.cache.clear()

### Glide
- activity/viewのcontextにより自動でメモリ開放しているとのこと。
- でも必要に応じてclearしておくのが無難。
- Glide.get(context).clearMemory()

### リスナーの登録／解除
- addObserver/removeObserver
- addListener/removeListener
- メモリリークはだいたいこいつららしい。

### Release Binding/Adapter
- _binding = null
- recyclerView.adapter = null

### 遅延処理
- Handler(Looper.getMainLooper()).postDelayed は自己参照してメモリリークが発生しやすい。
- View.postDelayed をつかう。
- View側でattachの状態を見てくれるらしい。

### 広告SDK
- よくあるよくある。