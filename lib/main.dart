import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dotcourt.github.io',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'dotcourt.github.io'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const simpleBookmarkPlayStoreUrl =
      "https://play.google.com/store/apps/details?id=com.mkt120.simplebookmark";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  const TitleWidget(title: 'Greeting'),
                  const IndentWidget(
                    widget:
                        Text('どうも。どっことです。\nコーディングしたり、ゲームしたり、ブログを書いたりしています。'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Divider(thickness: 1),
                  ),
                  const TitleWidget(title: 'Interest'),
                  const IndentWidget(
                    widget: Text(
                      '興味があるもの',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12)),

                  const IndentWidget(widget: SubTitleWidget(title: 'Mobile')),
                  const IndentWidget(
                    hierarchy: 2,
                    widget: Text('・Android', style: TextStyle(fontSize: 16)),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12)),
                  const IndentWidget(
                    hierarchy: 2,
                    widget: Text('・iOS', style: TextStyle(fontSize: 16)),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12)),
                  const IndentWidget(
                    widget: SubTitleWidget(title: 'Multi Platform'),
                  ),
                  const IndentWidget(
                    hierarchy: 2,
                    widget:
                        Text('・React native', style: TextStyle(fontSize: 16)),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12)),
                  const IndentWidget(
                    hierarchy: 2,
                    widget: Text('・Flutter', style: TextStyle(fontSize: 16)),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12)),
                  const IndentWidget(
                    widget: SubTitleWidget(title: 'Others'),
                  ),
                  const IndentWidget(
                    hierarchy: 2,
                    widget: Text('・Webサービス', style: TextStyle(fontSize: 16)),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12)),
                  const IndentWidget(
                    hierarchy: 2,
                    widget: Text('・CI/CD', style: TextStyle(fontSize: 16)),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12)),
                  const IndentWidget(
                    hierarchy: 2,
                    widget: Text('・自動化/効率化', style: TextStyle(fontSize: 16)),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12)),
                  const IndentWidget(
                    hierarchy: 2,
                    widget: Text('・競技プログラミング', style: TextStyle(fontSize: 16)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Divider(thickness: 1),
                  ),
                  // ----------------------------------
                  const TitleWidget(title: 'Achievement'),
                  GestureDetector(
                    child: const IndentWidget(
                      widget: SubTitleWidget(title: "SimpleBookmark"),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12)),
                  IndentWidget(
                    hierarchy: 2,
                    widget: RichText(
                      text: TextSpan(
                        text: "ダウンロードはこちらから",
                        style: const TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            color: Colors.white),
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launch(simpleBookmarkPlayStoreUrl);
                          },
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  const IndentWidget(
                    hierarchy: 2,
                    widget: Text(
                        "ブックマークを簡単に整理できるブックマークアプリです。\nAndroidのスマートフォンを使っているユーザは、GoogleChromeのブックマークが整理しにくいという煩わしさを感じる時があると思います。\nこのアプリは「共有ボタン」をタップするだけでブックマークを追加することでき、ラベルやタグを使って簡単、シンプルにブックマークを整理することができます。",
                        style: TextStyle(fontSize: 16)),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 128)),
                  const Text(
                    "This page was generated by GitHub Pages.",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          isWide(context) ? EndDrawer().drawerDefault() : Container(width: 0),
        ],
      ),
      endDrawer: !isWide(context) ? EndDrawer().drawerDefault() : null,
    );
  }

  bool isWide(BuildContext context) {
    return MediaQuery.of(context).size.width >= 750;
  }
}

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 32),
        textAlign: TextAlign.start,
      ),
    );
  }
}

class SubTitleWidget extends StatelessWidget {
  final String title;

  const SubTitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 24),
        textAlign: TextAlign.start,
      ),
    );
  }
}

class IndentWidget extends StatelessWidget {
  final Widget widget;
  final double hierarchy;

  const IndentWidget({Key? key, required this.widget, this.hierarchy = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: (12 * hierarchy)),
      child: widget,
    );
  }
}

class EndDrawer {
  static const iconUrl = "https://avatars.githubusercontent.com/u/25135231?v=4";
  static const urlTwitter = "https://www.twitter.com/mkt120";
  static const urlGithub = "https://github.com/mkt120";
  static const urlQiita = "https://qiita.com/mkt120";
  static const urlAtCoder = "https://atcoder.jp/users/mkt120";
  static const urlTechNote = "https://sites.google.com/view/sound-of-tech/";
  static const urlGoogleSite = "https://sites.google.com/view/dotcourt/";

  Drawer drawerDefault() {
    return Drawer(
      child: ListView(
        children: [
          // アイコン
          DrawerHeader(
            child: Image.network(iconUrl),
          ),
          const ListTile(
            title: Text("名前"),
            subtitle: Text("dot-court (どっこと)"),
          ),
          const ListTile(
            title: Text("説明"),
            subtitle: Text("ソフトウェア開発とボードゲームに興味があります"),
          ),
          const Divider(thickness: 1),

          // ****** 外部リンク *******
          ListTile(
            title: const Text("Twitter"),
            subtitle: const Text("@mkt120"),
            onTap: () => {launch(urlTwitter)},
          ),
          ListTile(
            title: const Text("GitHub"),
            subtitle: const Text("@mkt120"),
            onTap: () => {launch(urlGithub)},
          ),
          ListTile(
            title: const Text("Qiita"),
            subtitle: const Text("@mkt120"),
            onTap: () => {launch(urlQiita)},
          ),
          ListTile(
            title: const Text("AtCoder"),
            subtitle: const Text("@mkt120"),
            onTap: () => {launch(urlAtCoder)},
          ),
          ListTile(
            title: const Text("Tech note"),
            subtitle: const Text("技術ノート"),
            onTap: () => {launch(urlTechNote)},
          ),
          ListTile(
            title: const Text("その他"),
            subtitle: const Text("エンジニア以外についてはこちら"),
            onTap: () => {launch(urlGoogleSite)},
          ),
        ],
      ),
    );
  }
}
