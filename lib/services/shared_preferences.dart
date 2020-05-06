import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  // THIS IS FOR FAVOURITE MARKINGS OF THE COMPANIES ///////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
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
    return prefs.setStringList("companyNames", newList);
  }

  static Future<bool> removeCompanyNames(List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> companies =
        await getCompanyNames(); //get the list so that we can modify it

    var newList = [...companies, ...value].toSet().toList();

    newList.remove(value[0]);
    return prefs.setStringList("companyNames", newList);
  }
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  ///////THIS IS FOR FAVOURITE MARKINGS OF THE PROGRAMS/////////////
  //////////////////////////////////////////////////////////////////
  static final String _programNames = "programNames";

  static Future<List<String>> getProgramNames() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(_programNames) ?? [];
  }

  static Future<bool> setProgramNames(List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(_programNames).contains([value]);
  }

  static Future<bool> addProgramNames(List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> programs =
    await getProgramNames(); //get the list so that we can modify it

    var newList = [...programs, ...value].toSet().toList();
    return prefs.setStringList("programNames", newList);
  }

  static Future<bool> removeProgramNames(List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> programs =
    await getProgramNames(); //get the list so that we can modify it

    var newList = [...programs, ...value].toSet().toList();

    newList.remove(value[0]);
    return prefs.setStringList("programNames", newList);
  }
}
