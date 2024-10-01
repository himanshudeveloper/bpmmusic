import 'package:bmp_music/features/song/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLoopMode(LoopMode loopMode) async {
  // Obtain an instance of SharedPreferences
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  await sharedPreferences.setString('loopMode', loopMode.name);
}
