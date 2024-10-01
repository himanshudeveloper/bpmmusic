import 'package:shared_preferences/shared_preferences.dart';

Future<bool?> readCheck() async {
  // Obtain an instance of SharedPreference
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  // Retrieve the last saved bpm from SharedPreferences
  return sharedPreferences.getBool(
    'check',
  );
}

Future<void> saveCheck(bool check) async {
  // Obtain an instance of SharedPreferences
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  // Save the curent bpm to SharedPreference
  await sharedPreferences.setBool('check', check);
}
