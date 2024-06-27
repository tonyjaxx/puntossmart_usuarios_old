class GetFriendModel {
  String? message;
  String? locale;
  List<Friends>? friends;

  GetFriendModel({this.message, this.locale, this.friends});

  GetFriendModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    locale = json['locale'];
    if (json['Friends'] != null) {
      friends = <Friends>[];
      json['Friends'].forEach((v) {
        friends!.add(new Friends.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['locale'] = this.locale;
    if (this.friends != null) {
      data['Friends'] = this.friends!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Friends {
  int? userId;
  String? uuid;
  String? name;
  String? profilePic;

  Friends({this.userId, this.uuid, this.name, this.profilePic});

  Friends.fromJson(Map<String, dynamic> json) {
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
