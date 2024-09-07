class ProductsDataModel {
  var status;
  List<Data>? data;

  ProductsDataModel({this.status, this.data});

  ProductsDataModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  String? id;
  String? vendorId;
  String? productName;
  String? description;
  List<Image>? image;
  var originalPrice;
  var discountPrice;
  var discount;
  bool? discountActive;
  String? mainCategory;
  String? categoryId;
  String? subCategoryId;
  var rating;
  var numOfReviews;
  List<String>? size;
  List<String>? color;
  var stock;
  bool? status;
  bool? isProductVerified;
  List<Reviews>? reviews;
  String? createdAt;
  String? updatedAt;
  var v;
  bool? isDeal;

  Data(
      {this.id,
      this.vendorId,
      this.productName,
      this.description,
      this.image,
      this.originalPrice,
      this.discountPrice,
      this.discount,
      this.discountActive,
      this.mainCategory,
      this.categoryId,
      this.subCategoryId,
      this.rating,
      this.numOfReviews,
      this.size,
      this.color,
      this.stock,
      this.status,
      this.isProductVerified,
      this.reviews,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.isDeal});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    vendorId = json["vendorId"];
    productName = json["productName"];
    description = json["description"];
    image = json["image"] == null
        ? null
        : (json["image"] as List).map((e) => Image.fromJson(e)).toList();
    originalPrice = json["originalPrice"];
    discountPrice = json["discountPrice"];
    discount = json["discount"];
    discountActive = json["discountActive"];
    mainCategory = json["mainCategory"];
    categoryId = json["categoryId"];
    subCategoryId = json["subCategoryId"];
    rating = json["rating"];
    numOfReviews = json["numOfReviews"];
    size = json["size"] == null ? null : List<String>.from(json["size"]);
    color = json["color"] == null ? null : List<String>.from(json["color"]);
    stock = json["stock"];
    status = json["status"];
    isProductVerified = json["isProductVerified"];
    reviews = json["reviews"] == null
        ? null
        : (json["reviews"] as List).map((e) => Reviews.fromJson(e)).toList();
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    isDeal = json["isDeal"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["vendorId"] = vendorId;
    _data["productName"] = productName;
    _data["description"] = description;
    if (image != null) {
      _data["image"] = image?.map((e) => e.toJson()).toList();
    }
    _data["originalPrice"] = originalPrice;
    _data["discountPrice"] = discountPrice;
    _data["discount"] = discount;
    _data["discountActive"] = discountActive;
    _data["mainCategory"] = mainCategory;
    _data["categoryId"] = categoryId;
    _data["subCategoryId"] = subCategoryId;
    _data["rating"] = rating;
    _data["numOfReviews"] = numOfReviews;
    if (size != null) {
      _data["size"] = size;
    }
    if (color != null) {
      _data["color"] = color;
    }
    _data["stock"] = stock;
    _data["status"] = status;
    _data["isProductVerified"] = isProductVerified;
    if (reviews != null) {
      _data["reviews"] = reviews?.map((e) => e.toJson()).toList();
    }
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    _data["isDeal"] = isDeal;
    return _data;
  }
}

class Reviews {
  String? user;
  String? name;
  var rating;
  String? comment;
  String? id;

  Reviews({this.user, this.name, this.rating, this.comment, this.id});

  Reviews.fromJson(Map<String, dynamic> json) {
    user = json["user"];
    name = json["name"];
    rating = json["rating"];
    comment = json["comment"];
    id = json["_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["user"] = user;
    _data["name"] = name;
    _data["rating"] = rating;
    _data["comment"] = comment;
    _data["_id"] = id;
    return _data;
  }
}

class Image {
  String? url;
  String? id;

  Image({this.url, this.id});

  Image.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    id = json["_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["_id"] = id;
    return _data;
  }
}
