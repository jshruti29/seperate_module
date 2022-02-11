import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  Future setString(String key, String string) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, string);
  }
  Future setStringList(String key,List<String> value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
  }

  Future stringListClear(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getStringList(key)!.clear();
  }

  Future setInt(String key, int intValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, intValue);
  }

  Future<bool> containsKey(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  Future setBool(String key, bool value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future setObject(String key, Object object) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(object);
    prefs.setString(key, json);
  }

  Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? string = prefs.getString(key);
    return string;
  }

  Future<List<String>?> getStringList(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? listOfString = prefs.getStringList(key);
    return listOfString;
  }


  Future<Object?> getObject(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? string = prefs.getString(key);
    return string;
  }

  Future <bool?> getBool(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? intValue = prefs.getBool(key);
    return intValue;
  }

  Future<int?> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? intValue = prefs.getInt(key);
    return intValue;
  }
  Future<bool> clearData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.get(key);
    prefs.clear();
    return true;
  }

  Future<bool> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return true;
  }

  // Future<bool> containsKey(String key) async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool containsKey = prefs.containsKey(key);
  //   return containsKey;
  // }


}