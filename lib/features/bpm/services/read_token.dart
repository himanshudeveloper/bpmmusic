import 'package:shared_preferences/shared_preferences.dart';

Future<String> readtoken() async {
  // Obtain an instance of SharedPreference
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  // Retrieve the last saved bpm from SharedPreferences
  return sharedPreferences.getString('token') ??
      "eyJraWQiOiJPR1ZJSkxJVElKIiwiYWxnIjoiRVMyNTYifQ.eyJpc3MiOiJaOEpFN0NXODZDIiwiaWF0IjoxNzIxMDY2MTkyLCJleHAiOjE3MjM2NTgxOTJ9.BCC_Eg1hi5R9RENyQHGj4dSdEZ3tDsAHaA439BFCfO7L8TKSqj0bRHvWbABdohvIfJJM_b2eFqz__lSpX8tCTQ";
}
