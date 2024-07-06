class UserByQRCodeModel {
  String? message;
  String? locale;
  User? user;

  UserByQRCodeModel({this.message, this.locale, this.user});

  UserByQRCodeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    locale = json['locale'];
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['locale'] = this.locale;
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? userId;
  String? uuid;
  String? name;
  String? phone;
  String? profilePic;

  User({this.userId, this.uuid, this.name, this.phone, this.profilePic});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    uuid = json['uuid'];
    name = json['name'];
    phone = json['phone'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['profilePic'] = this.profilePic;
    return data;
  }
}
