import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrance {
  SharedPrefrance._();
  late SharedPreferences sharedPreferences;
  static final instanc = SharedPrefrance._();

  Future<void> initialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setOnboardingShown(bool value) async {
    await _ensureInitialized();
    return await sharedPreferences.setBool("onboarding_shown", value);
  }

  bool isOnboardingShown() {
    if (!isInitialized()) return false;
    return sharedPreferences.getBool("onboarding_shown") ?? false;
  }

  bool isInitialized() {
    // ignore: unnecessary_null_comparison
    return sharedPreferences != null;
  }

  Future<void> _ensureInitialized() async {
    if (!isInitialized()) {
      await initialization();
    }
  }

  Future<bool> setUserName({required String key, required String userName}) {
    return sharedPreferences.setString(key, userName);
  }

  String? getUserName(String key) {
    return sharedPreferences.getString(key);
  }

  Future<bool> removeFromShared({required String key}) {
    return sharedPreferences.remove(key);
  }
}
