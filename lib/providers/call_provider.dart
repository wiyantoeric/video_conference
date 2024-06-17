import 'package:flutter/material.dart';
import 'package:video_conference/model/caption.dart';
import 'package:video_conference/model/user.dart';
import 'package:video_conference/temp/user_data.dart';

class CallProvider extends ChangeNotifier {
  final List<User> _participants = [];
  final List<Caption> _chats = [Caption(user: user1, text: 'hi')];
  bool _isOnCall = false;

  List<User> get participants => _participants;
  List<Caption> get chats => _chats;
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

  void sendChat(User user, String message) {
    if (message.isEmpty) return;
    print(_chats);
    _chats.add(Caption(user: user, text: message));
    notifyListeners();
  }
}
