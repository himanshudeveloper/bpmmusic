import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveToken(String token) async {
  // Obtain an instance of SharedPreferences
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  // Save the curent bpm to SharedPreference
  await sharedPreferences.setString('token', token);
}
