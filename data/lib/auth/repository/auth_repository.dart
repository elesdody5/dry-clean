import 'package:data/auth/firebase/firebase_cloud_store.dart';
import 'package:data/auth/model/remote/signup_model.dart';
import 'package:domain/model/result.dart';
import 'package:domain/model/signup_model.dart';

import '../firebase/firebase_auth_service_imp.dart';

class AuthRepositoryImp {
  FirebaseAuthService _firebaseAuthService;
  FirebaseCloudStore _firebaseCloudStore;

  AuthRepositoryImp(
      {FirebaseAuthService? firebaseAuthService,
      FirebaseCloudStore? firebaseCloudStore})
      : _firebaseAuthService = FirebaseAuthService.getInstance(),
        _firebaseCloudStore = FirebaseCloudStore();

  Future<Result> verifyPhone(String phone, String code) async {
    Result result = await _firebaseAuthService.verifyCode(code);
    return result;
  }

  @override
  Future<Result> signUp(SignUpModel signUpModel) async {
    Result<String> result = await _firebaseCloudStore
        .saveUserInfo(signUpModel.toRemoteSignUpModel());
    // if (result.succeeded()) {
    //   _saveUserInfo(signUpModel, result.getDataIfSuccess());
    // }
    return result;
  }

  // Future<void> _saveUserInfo(SignUpModel loginData,String userId) async {
  //   await _userManager.saveFCMToken(loginData.fcmToken);
  //   await _userManager.saveUserId(userId);
  //   await _userManager.saveUserType(loginData.userType);
  // }
  //
  //
  //
  // @override
  // Future<void> logout() async {
  //   String id = await _userManager.getUserId() ?? "";
  //   await _firebaseCloudStore.clearNotificationToken(id);
  //   await _userManager.deleteUserData();
  // }


  // @override
  // Future<LoginResponse> autoLogin() async {
  //   String? token = await _userManager.getToken();
  //   UserType? userType = await _userManager.getUserType();
  //   String? userId = await _userManager.getUserId();
  //   LoginResponse loginResponse =
  //       LoginResponse(token: token, userType: userType, userId: userId);
  //   token?.let((it) => _remoteAuth.addInterceptor(it));
  //   return loginResponse;
  // }

  @override
  // Future<void> saveNotificationToken(String? notificationToken) async {
  //   String? saveNotificationToken = await _userManager.getNotificationToken();
  //   String? userId = await _userManager.getUserId();
  //   if (notificationToken != saveNotificationToken) {
  //     await _userManager.saveNotificationToken(notificationToken);
  //     await _remoteAuth.updateNotificationToken(userId, notificationToken);
  //   }
  // }

  @override
  Future<Result> sendCode(String phone) {
    return _firebaseAuthService.sendCode(phone);
  }
}
