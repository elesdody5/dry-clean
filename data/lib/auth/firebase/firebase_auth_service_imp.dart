
import 'package:domain/model/result.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth;
  String? verificationId;
  static FirebaseAuthService? _instance;

  FirebaseAuthService._({FirebaseAuth? auth})
      : _auth = auth ?? FirebaseAuth.instance;

  static FirebaseAuthService getInstance({FirebaseAuth? auth}) {
    _instance ??= FirebaseAuthService._(auth: auth);
    return _instance!;
  }

  Future<Result> sendCode(String phone) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: "+2$phone",
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return Success(true);
    } on Exception catch (e) {
      return Error(Exception(e));
    }
  }

  Future<Result> verifyCode(String code) async {
    try {
      if (verificationId != null) {
        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId!, smsCode: code);

        // Sign the user in (or link) with the credential
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        return Success(true);
      }
      return Error(Exception("error verificationId"));
    } on Exception catch (e) {
      return Error(e);
    }
  }
}
