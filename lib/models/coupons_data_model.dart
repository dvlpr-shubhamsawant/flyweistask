
class CouponsDataModel {
  int? status;
  String? message;
  List<Data>? data;

  CouponsDataModel({this.status, this.message, this.data});

  CouponsDataModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  String? id;
  String? code;
  String? image;
  String? description;
  String? discountType;
  int? discountValue;
  String? startDate;
  String? expiryDate;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data({this.id, this.code, this.image, this.description, this.discountType, this.discountValue, this.startDate, this.expiryDate, this.createdAt, this.updatedAt, this.v});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    code = json["code"];
    image = json["image"];
    description = json["description"];
    discountType = json["discountType"];
    discountValue = json["discountValue"];
    startDate = json["startDate"];
    expiryDate = json["expiryDate"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["code"] = code;
    _data["image"] = image;
    _data["description"] = description;
    _data["discountType"] = discountType;
    _data["discountValue"] = discountValue;
    _data["startDate"] = startDate;
    _data["expiryDate"] = expiryDate;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}