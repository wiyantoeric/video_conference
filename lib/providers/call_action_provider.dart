import 'package:flutter/material.dart';

class CallActionProvider extends ChangeNotifier {
  bool _isMicOn = false;
  bool _isVideoOn = false;
  bool _isCaptionOn = false;
  bool _isWriting = false;

  bool get isMicOn => _isMicOn;
  bool get isVideoOn => _isVideoOn;
  bool get isCaptionOn => _isCaptionOn;
  bool get isWriting => _isWriting;

  void toggleMic() {
    _isMicOn = !_isMicOn;
    notifyListeners();
  }

  void toggleVideo() {
    _isVideoOn = !_isVideoOn;
    notifyListeners();
  }

  void toggleCaption() {
    _isCaptionOn = !_isCaptionOn;
    notifyListeners();
  }
}
