class BuyHistoryModel {
  String? message;
  String? locale;
  List<History>? history;

  BuyHistoryModel({this.message, this.locale, this.history});

  BuyHistoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    locale = json['locale'];
    if (json['history'] != null) {
      history = <History>[];
      json['history'].forEach((v) {
        history!.add(new History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['locale'] = this.locale;
    if (this.history != null) {
      data['history'] = this.history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class History {
  int? id;
  int? userId;
  int? packageId;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Package? package;

  History(
      {this.id,
      this.userId,
      this.packageId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.package});

  History.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    packageId = json['package_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    package =
        json['package'] != null ? new Package.fromJson(json['package']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['package_id'] = this.packageId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.package != null) {
      data['package'] = this.package!.toJson();
    }
    return data;
  }
}

class Package {
  int? id;
  String? packageName;
  int? points;
  int? pens;
  String? bgColor;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Package(
      {this.id,
      this.packageName,
      this.points,
      this.pens,
      this.bgColor,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Package.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageName = json['package_name'];
    points = json['points'];
    pens = json['pens'];
    bgColor = json['bg_color'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_name'] = this.packageName;
    data['points'] = this.points;
    data['pens'] = this.pens;
    data['bg_color'] = this.bgColor;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
