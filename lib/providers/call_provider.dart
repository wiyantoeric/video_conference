import 'package:flutter/material.dart';
import 'package:video_conference/model/user.dart';

class CallProvider extends ChangeNotifier {
  final List<User> _participants = [];

  List<User> get participants => _participants;

  void addParticipant({required User user}) {
    _participants.add(user);
    notifyListeners();
  }
}
