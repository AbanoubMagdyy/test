import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> putData({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences?.setBool(key, value);
  }

  static bool? getData({required String key,}) {
    return sharedPreferences?.getBool(key);
  }

  static Future<bool>? saveData({
  required String key,
  required dynamic value,
}){
    if(value is bool) {
      return sharedPreferences?.setBool(key, value);
    } else if(value is int){
      return sharedPreferences?.setInt(key, value);
    }  else if(value is double){
      return sharedPreferences?.setDouble(key, value);
    }else{
      return sharedPreferences?.setString(key, value);
    }
  }

  static dynamic getAllData({
    required String key,
  }){
  return sharedPreferences?.get(key);
  }

  static Future<bool>? removeData({required String key}){
    return sharedPreferences?.remove(key);
  }
}
