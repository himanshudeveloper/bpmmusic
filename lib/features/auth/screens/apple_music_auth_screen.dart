import 'package:flutter/material.dart';
import 'my_music_kit_plugin.dart';

class AppleMusicAuthPage extends StatefulWidget {
  const AppleMusicAuthPage({super.key});

  @override
  _AppleMusicAuthPageState createState() => _AppleMusicAuthPageState();
}

class _AppleMusicAuthPageState extends State<AppleMusicAuthPage> {
  List<dynamic> _songs = [];

  void _searchMusic() async {
    String query = "Taylor Swift";
    List<dynamic> results = await MyMusicKitPlugin.searchMusic(query);
    setState(() {
      _songs = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Apple Music Search'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _searchMusic,
            child: const Text('Search Music'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_songs[index]['title']),
                  subtitle: Text(_songs[index]['artist']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // late final WebViewController _controller;

  // Future<void> init() async {
  //   try {
  //     HttpsCallable callable =
  //         FirebaseFunctions.instance.httpsCallable('generateDeveloperToken');

  //     final result = await callable.call();

  //     final developerToken = result.data['token'];

  //     print("developer token: " + developerToken);

  //     final String htmlContent = await _loadHtmlFromAssets(developerToken);

  //     await _controller.loadHtmlString(htmlContent);
  //   } catch (e) {
  //     debugPrint("ERROR : ${e.toString()}");
  //   }
  // }

  // Future<String> _loadHtmlFromAssets(String developerToken) async {
  //   String fileText =
  //       await rootBundle.loadString('assets/apple_music_auth.html');

  //   final replace = fileText.replaceAll('YOUR_DEVELOPER_TOKEN', developerToken);

  //   return replace;
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = WebViewController()
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //     ..addJavaScriptChannel(
  //       'MessageInvoker',
  //       onMessageReceived: (JavaScriptMessage message) {
  //         print("developertokenmes: " + message.toString());
  //         final userToken = message.message;
  //         debugPrint('Music User Token: $userToken');
  //       },
  //     )
  //     ..enableZoom(false);

  //   init();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Apple Music Auth'),
  //     ),
  //     body: WebViewWidget(controller: _controller),
  //   );
  // }
}
