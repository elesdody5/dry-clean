/*
* This class responsible for dealing with user data throw the application
* */




import 'dart:convert';

import 'package:data/auth/model/local/local_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'const.dart';

class SharedPreferencesManagerImp {
  SharedPreferencesManagerImp();

  
  Future<void> deleteUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
  
  
  Future<String?> getUserType() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userType = sharedPreferences.getString(userTypeKey);
    return userType;
  }

  
  Future<void> saveUserType(String? userType) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (userType != null) {
      sharedPreferences.setString(userTypeKey, userType);
    }
  }

  
  Future<String?> getNotificationToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? notificationToken =
    sharedPreferences.getString(notificationTokenKey);
    return notificationToken;
  }

  
  Future<void> saveNotificationToken(String? notificationToken) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(notificationToken!=null) {
      sharedPreferences.setString(notificationTokenKey, notificationToken);
    }
  }

  
  Future<String?> getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userIdKey);
  }

  
  Future<void> saveUserId(String? userId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (userId != null) sharedPreferences.setString(userIdKey, userId);
  }

  
  Future<LocalUser?> getUserDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userDetails = sharedPreferences.getString(userKey);
    if (userDetails == null) return null;
    Map<String, dynamic> userJson = json.decode(userDetails);
    return LocalUser.fromJson(userJson);
  }

  
  Future<void> saveUserDetails(LocalUser user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userJson = user.toJson();
    String userDetails = json.encode(userJson);
    sharedPreferences.setString(userKey, userDetails);
  }
}
