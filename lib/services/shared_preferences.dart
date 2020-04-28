import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final String _companyNames = "companyNames";

  static Future<List<String>> getCompanyNames() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(_companyNames) ?? [];
  }

  static Future<bool> setCompanyNames(List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(_companyNames).contains([value]);
  }

  static Future<bool> addCompanyNames(List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> companies =
        await getCompanyNames(); //get the list so that we can modify it

    var newList = [...companies, ...value].toSet().toList();
    print('adding $value');
    return prefs.setStringList("companyNames", newList);
  }

  static Future<bool> removeCompanyNames(List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> companies =
        await getCompanyNames(); //get the list so that we can modify it

    var newList = [...companies, ...value].toSet().toList();

    newList.remove(value[0]);
    print('removing $value');
    return prefs.setStringList("companyNames", newList);
  }
}
