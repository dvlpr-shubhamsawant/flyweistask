class QuantityUpdateDataModel {
  var status;
  String? message;
  Data? data;

  QuantityUpdateDataModel({this.status, this.message, this.data});

  QuantityUpdateDataModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? user;
  List<Products>? products;
  dynamic coupon;
  bool? walletUsed;
  var shippingPrice;
  var totalPaidAmount;
  String? createdAt;
  String? updatedAt;
  var v;

  Data(
      {this.id,
      this.user,
      this.products,
      this.coupon,
      this.walletUsed,
      this.shippingPrice,
      this.totalPaidAmount,
      this.createdAt,
      this.updatedAt,
      this.v});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    user = json["user"];
    products = json["products"] == null
        ? null
        : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
    coupon = json["coupon"];
    walletUsed = json["walletUsed"];
    shippingPrice = json["shippingPrice"];
    totalPaidAmount = json["totalPaidAmount"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["user"] = user;
    if (products != null) {
      _data["products"] = products?.map((e) => e.toJson()).toList();
    }
    _data["coupon"] = coupon;
    _data["walletUsed"] = walletUsed;
    _data["shippingPrice"] = shippingPrice;
    _data["totalPaidAmount"] = totalPaidAmount;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}

class Products {
  String? product;
  String? vendorId;
  String? size;
  var quantity;
  var price;
  var totalAmount;
  String? id;

  Products(
      {this.product,
      this.vendorId,
      this.size,
      this.quantity,
      this.price,
      this.totalAmount,
      this.id});

  Products.fromJson(Map<String, dynamic> json) {
    product = json["product"];
    vendorId = json["vendorId"];
    size = json["size"];
    quantity = json["quantity"];
    price = json["price"];
    totalAmount = json["totalAmount"];
    id = json["_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["product"] = product;
    _data["vendorId"] = vendorId;
    _data["size"] = size;
    _data["quantity"] = quantity;
    _data["price"] = price;
    _data["totalAmount"] = totalAmount;
    _data["_id"] = id;
    return _data;
  }
}
