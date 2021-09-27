import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences sharedPreferences;

  static int() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

   static Future<bool>setData({
    @required String key,
    @required bool value}) async {
     await sharedPreferences.setBool(key, value);
  }
  static bool getData ( {
  @required String key}){
    sharedPreferences.get(key);
  }
}
