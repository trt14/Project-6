import 'package:flutter/foundation.dart';
import 'package:my_products_app/model/user_model.dart';
import 'package:my_products_app/services/setup.dart';

class UserDataLayer {
  UserDataLayer() {
    users.add(UserModel(
        name: "name",
        password: "1234",
        id: 1,
        cr: "3214",
        email: "email@",
        status: false));
    loadUser();
    updateCurrentUser();
  }
  late UserModel? user;

  List<UserModel> users = [];

  bool checkUser({required String email, required String password}) {
    for (UserModel element in users) {
      if (element.email == email && element.password == password) {
        return true;
      }
    }
    return false;
  }

  void saveUser(
      {required String name,
      required String pass,
      required String cr,
      required String email,
      required bool status}) {
    UserModel user = UserModel(
        name: name,
        password: pass,
        id: users.length + 1,
        cr: cr,
        email: email,
        status: status);
    users.add(user);
    saveUserStorage();
  }

  updateCurrentUser() {
    if (users.isNotEmpty) {
      final temp = users.where((element) => element.status == true);
      if (temp.isNotEmpty) {
        user = temp.first;
      } else {
        user = null;
      }
    }
  }

  changeUserState(String email) {
    for (UserModel element in users) {
      if (element.email == email) {
        element.status = !element.status;
      }
    }
    saveUserStorage();
  }

  void saveUserStorage() {
    if (kDebugMode) {
      print("Enter to save user function");
    }
    try {
      if (kDebugMode) {
        print("Enter to storage");
      }
      storage.setString("user", UserModel.encode(users));
    } catch (e) {
      if (kDebugMode) {
        print("error in saving user");
      }
    }
  }

  loadUser() async {
    print("load user data");
    try {
      print("storage ____");
      if (storage.containsKey("user")) {
        users = UserModel.decode(storage.getString("user")!);
      }
    } catch (e) {
      if (kDebugMode) {
        print("error in loadin user data");
      }
    }
  }
}
