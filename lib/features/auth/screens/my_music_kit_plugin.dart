import 'dart:async';
import 'package:flutter/services.dart';

class MyMusicKitPlugin {
  static const MethodChannel _channel =
      MethodChannel('my_music_kit_plugin');

  static Future<List<dynamic>> searchMusic(String query) async {
    final List<dynamic> result =
        await _channel.invokeMethod('searchMusic', {'query': query});
    return result;
  }
}
