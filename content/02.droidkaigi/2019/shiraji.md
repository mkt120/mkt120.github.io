---
title: DroidKaigi 2019 - Android Studio 設定見直してみませんか？ / shiraji [JA] を視聴した
description: Droidkaigiの登壇「DroidKaigi 2019 - Android Studio 設定見直してみませんか？ / shiraji [JA]」の視聴備忘録です。
navigation: true
draft: false
date: 2025-06-17T07:00:00+09:00
---

## 視聴元

::VideoFrame{ url="https://www.youtube.com/watch?v=MV14DDxv6DE" }
::


## 自分専用のポップアップを作れる
- Preference | Apperance & Behavior | QuickList 
- 作った設定はショートカットキーを割り振れる。

## Notification
- Preference | Apperance & Behavior | Notification
- たとえば、Gradle sync の設定をBalloonにするとsync完了時にNotification表示。
- 一番右のチェックを付けると、なんとAndroidStudioがしゃべる。

## File Color
- プロジェクトのファイル名が変わる。
- Preference | Apperance & Behavior | FileColor
- 設定追加 | Production に設定すると... Bundleされるファイルがハイライトされる

## File Format
- AndroidStudioにコミットする前にフォーマットしたりオプティマイズする設定がある。
- コードを書いている最中に気づくには。
    - Preference | Editor | Inspection | File is not formatte according ... にチェックを付ける。
    - 特にエラーに設定しておくと、alt + enter で処理してくれる。

## Break Point
- break point には条件設定ができる。
    - でも簡単に消せてしまう。頑張って書いたのに...。
- Preference | Build, Excetuion, Deployment | Confirm removal of confitional or logging breakpoints を設定すると、確認ダイアログを表示してくれる。
    - 条件を設定していないものはすぐに消してくれる。

## Inject Language
- jsonのstring に対して alt + enter で inject languarge or reference。
    - 選択してjsonを設定すると、テキストがjsonとして扱われる。
    - そのテキストに対してalt + enter で Edit Json Fragment をする。
    - jsonの編集領域が表示されて、素敵！
    - さらにアノテーションを設定することができて、「jsonのテキストだよ」と明示できる。

## Copy Preferences Path
- 右クリック > Copy Preferences Path。

## Pluginのインストール強制
- Preference | Build, Excetuion, Deployment | Required Plugins。
- インストールされているPluginから必須のPluginを追加する。
- 再度AndroidStudioを起動したときに必要なPluginがなければエラーポップアップが表示される。

