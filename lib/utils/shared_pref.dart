import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  showOnBoard() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('showOnBoard', false);
    return pref;
  }

  showLogin() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('showLogin', false);
    return pref;
  }
}
