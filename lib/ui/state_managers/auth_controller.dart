import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/profile_models.dart';
import '../screens/signup_login/email_verification_screen.dart';

class AuthController extends GetxController {
  static String? _token;
  static ProfileData? _profileData;

  static String? get token => _token;

  static ProfileData? get profileData => _profileData;

  Future<bool> isLoggedIn() async {
    await getToken();
    await getProfileData();
    return _token != null;
  }

  Future<void> saveToken(String userToken) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _token = userToken;
    await preference.setString('token', userToken);
  }

  Future<void> getToken() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _token = preference.getString('token');
  }

  Future<void> saveProfileData(ProfileData profile) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _profileData = profile;
    await preference.setString('user_profile', profile.toJson().toString());
  }

  Future<void> getProfileData() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _profileData = ProfileData.fromJson(
        jsonDecode(preference.getString('user_profile') ?? '{}'));
  }

  Future<void> clearUserData() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    await preference.clear();
    _token = null;
  }

  Future<void> logOut() async {
    await clearUserData();
    Get.to(const EmailVerificationScreen());
  }

  Future<bool> checkAuthValidation() async {
    final authState = await Get.find<AuthController>().isLoggedIn();
    if (authState == false) {
      Get.to(const EmailVerificationScreen());
    }
    return authState;
  }
}
