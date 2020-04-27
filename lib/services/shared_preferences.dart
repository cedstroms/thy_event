import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final String _companyNames = "companyNames";

  static Future<List<String>> getCompanyNames() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(_companyNames) ?? ['nothing to show'];
  }

  static Future<bool> setCompanyNames(List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> companies = await getCompanyNames();

    var newList = [...companies, ...value].toSet().toList();

    return prefs.setStringList("companyNames", newList);
  }

  static Future<bool> removeCompanyNames(List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> companies = await getCompanyNames();

    var newList = [...companies, ...value].toSet().toList();

    newList.remove(value[0]);

    return prefs.setStringList("companyNames", newList);
  }
}
