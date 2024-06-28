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
  int? friendshipId;
  int? userId;
  String? uuid;
  String? name;
  String? phone;
  String? profilePic;

  Friends(
      {this.friendshipId,
      this.userId,
      this.uuid,
      this.name,
      this.phone,
      this.profilePic});

  Friends.fromJson(Map<String, dynamic> json) {
    friendshipId = json['friendship_id'];
    userId = json['user_id'];
    uuid = json['uuid'];
    name = json['name'];
    phone = json['phone'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['friendship_id'] = this.friendshipId;
    data['user_id'] = this.userId;
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['profilePic'] = this.profilePic;
    return data;
  }
}
