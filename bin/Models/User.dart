// ignore_for_file: file_names

class User {
  String? username;
  String? password;
  String? name;
  String? email;

  User({
    required this.username,
    required this.password,
    this.name,
    this.email,
  });

  factory User.fromJson({required Map json}) {
    return User(
      username: json["username"],
      password: json["password"],
      name: json["name"],
      email: json["email"],
    );
  }
}
