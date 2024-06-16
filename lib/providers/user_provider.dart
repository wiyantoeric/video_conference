import 'package:flutter/material.dart';
import 'package:video_conference/model/user.dart';

class UserProvider extends ChangeNotifier {
  late User _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  User get user => _user;
}
