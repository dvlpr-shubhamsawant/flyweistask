
class Address {
  String? id;
  String? userId;
  String? fullName;
  String? phone;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  bool? isDefault;
  String? createdAt;
  String? updatedAt;
  int? v;

  Address({this.id, this.userId, this.fullName, this.phone, this.addressLine1, this.addressLine2, this.city, this.state, this.postalCode, this.country, this.isDefault, this.createdAt, this.updatedAt, this.v});

  Address.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    userId = json["userId"];
    fullName = json["fullName"];
    phone = json["phone"];
    addressLine1 = json["addressLine1"];
    addressLine2 = json["addressLine2"];
    city = json["city"];
    state = json["state"];
    postalCode = json["postalCode"];
    country = json["country"];
    isDefault = json["isDefault"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["userId"] = userId;
    _data["fullName"] = fullName;
    _data["phone"] = phone;
    _data["addressLine1"] = addressLine1;
    _data["addressLine2"] = addressLine2;
    _data["city"] = city;
    _data["state"] = state;
    _data["postalCode"] = postalCode;
    _data["country"] = country;
    _data["isDefault"] = isDefault;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}