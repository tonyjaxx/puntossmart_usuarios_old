class GetUserModel {
  String? message;
  String? locale;
  List<Users>? users;

  GetUserModel({this.message, this.locale, this.users});

  GetUserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    locale = json['locale'];
    if (json['Users'] != null) {
      users = <Users>[];
      json['Users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['locale'] = this.locale;
    if (this.users != null) {
      data['Users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  int? userId;
  String? uuid;
  String? name;
  String? profilePic;

  Users({this.userId, this.uuid, this.name, this.profilePic});

  Users.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    uuid = json['uuid'];
    name = json['name'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['profilePic'] = this.profilePic;
    return data;
  }
}
