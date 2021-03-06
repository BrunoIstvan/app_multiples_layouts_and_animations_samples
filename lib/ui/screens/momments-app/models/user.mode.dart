import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

mixin UserModel on Model {
  User _currentUser;
  User get user {
    return _currentUser;
  }

  void logout() async {
    _currentUser = null;
  }

  bool loginUser(String code) {
    if (code == '1234') {
      _currentUser = User(id: '1', name: 'Momenter');
      return true;
    }

    return false;
  }

  bool submit(Map<String, dynamic> rsvpData) {
    return true;
  }
}

class User {
  final String id;
  final String name;

  User({
    @required this.id,
    @required this.name,
  });
}
