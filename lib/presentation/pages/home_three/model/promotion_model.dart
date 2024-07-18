class PromotionModel {
  String? message;
  String? locale;
  List<Promotions>? promotions;

  PromotionModel({this.message, this.locale, this.promotions});

  PromotionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    locale = json['locale'];
    if (json['promotions'] != null) {
      promotions = <Promotions>[];
      json['promotions'].forEach((v) {
        promotions!.add(new Promotions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['locale'] = this.locale;
    if (this.promotions != null) {
      data['promotions'] = this.promotions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Promotions {
  int? id;
  int? shopId;
  String? title;
  String? image;
  String? video;
  int? points;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? userId;
  Shop? shop;

  Promotions(
      {this.id,
      this.shopId,
      this.title,
      this.image,
      this.video,
      this.points,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userId,
      this.shop});

  Promotions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    title = json['title'];
    image = json['image'];
    video = json['video'];
    points = json['points'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    userId = json['user_id'];
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['title'] = this.title;
    data['image'] = this.image;
    data['video'] = this.video;
    data['points'] = this.points;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['user_id'] = this.userId;
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    return data;
  }
}

class Shop {
  int? id;
  int? userId;

  Shop({this.id, this.userId});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    return data;
  }
}
