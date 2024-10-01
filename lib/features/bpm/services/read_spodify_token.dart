import 'package:shared_preferences/shared_preferences.dart';

Future<String> readsp() async {
  // Obtain an instance of SharedPreference
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  // Retrieve the last saved bpm from SharedPreferences
  return sharedPreferences.getString('sptoken') ?? "";
}
