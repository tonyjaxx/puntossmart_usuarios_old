class PackageModel {
  String? message;
  String? locale;
  List<Packages>? packages;

  PackageModel({this.message, this.locale, this.packages});

  PackageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    locale = json['locale'];
    if (json['packages'] != String) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(new Packages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['locale'] = this.locale;
    if (this.packages != String) {
      data['packages'] = this.packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Packages {
  int? id;
  String? packageName;
  int? points;
  int? pens;
  String? bgColor;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Packages(
      {this.id,
      this.packageName,
      this.points,
      this.pens,
      this.bgColor,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Packages.fromJson(Map<String, dynamic> json) {
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
