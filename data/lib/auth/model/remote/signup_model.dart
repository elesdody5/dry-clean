import 'package:domain/model/signup_model.dart';

class RemoteSignUpModel {
  String? name;
  String? phone;

  String? userType;

  String? address;

  RemoteSignUpModel(
      {this.name, this.phone, this.address, this.userType = "user"});

  Map<String, dynamic> toJson() {
    return {
      "username": name,
      "userType": userType,
      "phone": phone,
      "address": address,
    };
  }
}

extension Mapper on SignUpModel {
  RemoteSignUpModel toRemoteSignUpModel() => RemoteSignUpModel(
      name: name, phone: phone, userType: userType, address: address);
}
