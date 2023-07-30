class LocalUser {
  String? id;
  String? name;
  String? address;
  String? phone;
  String? userType;

  LocalUser({
    this.userType,
    this.name,
    this.id,
    this.phone,
    this.address,
  });

  factory LocalUser.fromJson(Map<String, dynamic> json) => LocalUser(
      id: json["_id"],
      name: json['username'],
      phone: json['phone'],
      address: json['address'],
      userType: json['userType']);

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': name,
        'phone': phone,
        'userType': userType,
        "address": address,
      };

  @override
  String toString() {
    return 'User{id: $id, name: $name, address: $address, phone: $phone, userType: $userType}';
  }
}
