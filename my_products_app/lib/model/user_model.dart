import 'dart:convert';

class UserModel {
  UserModel({required this.name, required this.password, required this.id,required this.cr, required this.email, required this.status});
  late final String name;
  late final String password;
  late final int id;
  late final String email;
  late final String cr;
  late bool status;
  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
    email = json['email'];
    id = json['id'];
    status = json['status'];
    cr = json['cr'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['password'] = password;
    data["id"] = id;
    data["email"] = email;
    data["cr"] = cr;
    data["status"] = status;

    return data;
  }

  static String encode(List<UserModel> users) => json.encode(
        users.map<Map<String, dynamic>>((user) => user.toJson()).toList(),
      );

  static List<UserModel> decode(String users) => (json.decode(users) as List<dynamic>)
      .map<UserModel>((user) => UserModel.fromJson(user))
      .toList();
}
