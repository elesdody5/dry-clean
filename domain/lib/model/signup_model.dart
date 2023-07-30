class SignUpModel {
  String? name;
  String? phone;

  String? userType;

  String? address;
  String? fcmToken;

  SignUpModel(
      {this.name,
      this.phone,
      this.address,
      this.fcmToken,
      this.userType = "user"});

  Map<String, dynamic> toJson() {
    return {
      "username": name,
      "userType": userType,
      "phone": phone,
      "address": address,
      "fcmToken": fcmToken
    };
  }
}
