---
title: DroidKaigi 2019 - ハマった時に役立つ通信系デバッグの話 / inomata [JA] を視聴した
description: Droidkaigiの登壇「DroidKaigi 2019 - ハマった時に役立つ通信系デバッグの話 / inomata [JA]」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-18T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=1KygxYsTSgY" }
::

## 通信回りはハマリどころになりやすい
- クライアント:OSとか、プラットフォームとか
- サーバ:クラウド設定とか
- その他ハードや通信環境とか

## 問題の切り分けができれば通信回りも怖くない
### クライアント観点
- リクエストが正しく送れている？
- レスポンスが正しく受け取れている？
- 通信異常時にエラー処理できている？

### Web開発者(API/Webフロント)としての切り分け
- リクエストを受け取れている？
- レスポンスを返せている？
- JSがクライアント上で動作している？
- リクエスト・レスポンスは正しい？

### 問題が起こったら結果を見極めてどこを修正すべきかを切り分ける
- アプリ？
- API？
- 無視すべき問題？

## アプリに問題が発生したときの確認手順
- 例外詳細のログを確認する
    - 接続確立に失敗：ConnectException
    - タイムアウト：ConnectTimeoutException
    - URL書式が不正：MalformedURLException
    - 名前解決に失敗：UnknownHostException
- HTTPレスポンスが届いていればHTTPステータスコードの確認
- クライアント側のレスポンスパース処理を確認

## WebViewの通信デバッグに使える道具
- PCのChrome開発コンソールが便利。
- [公式ドキュメント参照](https://developer.chrome.com/docs/devtools/?hl=ja)

## OkHttpのAPI通信デバッグに使える道具
- AndroidStudioのNetworkProfiler
    - [通信内容が丸見え！スゴすぎるAndroid Studio 3.0 のネットワークプロファイラ！](https://ryuta46.com/492)
- OkHttpのHttpLoggingInterceptor
- API周りで汎用的に使える確認用の道具
    - [Postman](https://www.postman.com/)
    - （Mac用）Paw
    - curlコマンド

## 通信デバッグに使える汎用的な道具
- プロキシ型の通信監視ツール
    - Charles
    - mitmproxy
- SSL通信に使う認証局への登録が必要