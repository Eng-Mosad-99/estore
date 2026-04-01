import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static late SharedPreferences sharedPreferences;
  static Future<SharedPreferences> init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  //! Save data to cache ==> write data to cache
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else {
      return await sharedPreferences.setStringList(key, value);
    }
  }

  //! Get data from cache ==> read data from cache
  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  //! Remove data from cache ==> remove data from cache
  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //! Clear all data from cache ==> clear all data from cache
  static Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }
}
