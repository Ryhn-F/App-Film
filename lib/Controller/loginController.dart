import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/userModel.dart';

class LoginController extends ChangeNotifier {
  final Box<UserModel> userBox = Hive.box<UserModel>('users');

  // Register New User
  bool registerUser(String email, String password) {
    if (userBox.containsKey(email)) {
      return false; // User already exists
    }
    userBox.put(email, UserModel(email: email, password: password));
    notifyListeners();
    return true;
  }

  // Validate Login
  bool validateUser(String email, String password) {
    UserModel? user = userBox.get(email);
    return user != null && user.password == password;
  }
}
