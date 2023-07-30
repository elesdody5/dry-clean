import 'package:data/auth/model/remote/signup_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/model/result.dart';

class FirebaseCloudStore {
  final FirebaseFirestore _fireStore;

  FirebaseCloudStore({FirebaseFirestore? firestore})
      : _fireStore = firestore ?? FirebaseFirestore.instance;

  Future<Result<String>> saveUserInfo(RemoteSignUpModel signUpModel) async {
    //Todo not implemented yet
    throw Exception();
  }

  Future<void> clearNotificationToken(String id) async {}
}
