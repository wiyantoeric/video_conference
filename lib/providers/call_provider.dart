import 'package:flutter/material.dart';
import 'package:video_conference/model/user.dart';

class CallProvider extends ChangeNotifier {
  final List<User> _participants = [];
  bool _isOnCall = false;

  List<User> get participants => _participants;
  bool get isOnCall => _isOnCall;

  void addParticipant({required User user}) {
    _participants.add(user);
    notifyListeners();
  }

  void removeParticipant({required User user}) {
    _participants.remove(user);
    notifyListeners();
  }

  void toggleCall() {
    _isOnCall = !_isOnCall;
    // TODO: Implement enter/leave call logic
    notifyListeners();
  }
}
