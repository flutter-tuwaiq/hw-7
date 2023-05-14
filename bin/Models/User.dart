class User {
  int? id;
  String? userName;
  String? password;
  String? userType;

  User({this.id, this.userName, this.password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    password = json['password'];
    userType = json['userType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['userType'] = this.userType;
    return data;
  }
}
