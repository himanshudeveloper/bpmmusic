import 'package:shared_preferences/shared_preferences.dart';

Future<String> readMusic() async {
  // Obtain an instance of SharedPreferences
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  // Save the curent bpm to SharedPreference
  return sharedPreferences.getString('music') ?? '';
}
