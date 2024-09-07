class RegisterUserApiResponse {
  int? status;
  String? message;
  Data? data;

  RegisterUserApiResponse({this.status, this.message, this.data});

  RegisterUserApiResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? userName;
  String? mobileNumber;
  String? email;
  String? password;
  String? otp;
  bool? isVerified;
  bool? isVendorVerified;
  int? wallet;
  String? userType;
  String? referralCode;
  dynamic referredBy;
  FactoryLocation? factoryLocation;
  String? id;
  List<dynamic>? dummyImage;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data(
      {this.userName,
      this.mobileNumber,
      this.email,
      this.password,
      this.otp,
      this.isVerified,
      this.isVendorVerified,
      this.wallet,
      this.userType,
      this.referralCode,
      this.referredBy,
      this.factoryLocation,
      this.id,
      this.dummyImage,
      this.createdAt,
      this.updatedAt,
      this.v});

  Data.fromJson(Map<String, dynamic> json) {
    userName = json["userName"];
    mobileNumber = json["mobileNumber"];
    email = json["email"];
    password = json["password"];
    otp = json["otp"];
    isVerified = json["isVerified"];
    isVendorVerified = json["isVendorVerified"];
    wallet = json["wallet"];
    userType = json["userType"];
    referralCode = json["referralCode"];
    referredBy = json["referredBy"];
    factoryLocation = json["factoryLocation"] == null
        ? null
        : FactoryLocation.fromJson(json["factoryLocation"]);
    id = json["_id"];
    dummyImage = json["dummyImage"] ?? [];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["userName"] = userName;
    _data["mobileNumber"] = mobileNumber;
    _data["email"] = email;
    _data["password"] = password;
    _data["otp"] = otp;
    _data["isVerified"] = isVerified;
    _data["isVendorVerified"] = isVendorVerified;
    _data["wallet"] = wallet;
    _data["userType"] = userType;
    _data["referralCode"] = referralCode;
    _data["referredBy"] = referredBy;
    if (factoryLocation != null) {
      _data["factoryLocation"] = factoryLocation?.toJson();
    }
    _data["_id"] = id;
    if (dummyImage != null) {
      _data["dummyImage"] = dummyImage;
    }
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}

class FactoryLocation {
  String? type;
  List<int>? coordinates;

  FactoryLocation({this.type, this.coordinates});

  FactoryLocation.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    coordinates = json["coordinates"] == null
        ? null
        : List<int>.from(json["coordinates"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    if (coordinates != null) {
      _data["coordinates"] = coordinates;
    }
    return _data;
  }
}
