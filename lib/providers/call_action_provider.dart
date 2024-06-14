import 'package:flutter/material.dart';

class CallActionProvider extends ChangeNotifier {
  bool _isMicOn = false;
  bool _isVideoOn = false;
  bool _isCaptionOn = true;
  bool _isWriting = false;
  bool _isCaptionFullScreen = false;

  bool get isMicOn => _isMicOn;
  bool get isVideoOn => _isVideoOn;
  bool get isCaptionOn => _isCaptionOn;
  bool get isWriting => _isWriting;
  bool get isCaptionFullScreen => _isCaptionFullScreen;

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
    // Turn off full screen if it's being opened
    if (_isCaptionFullScreen) toggleCaptionFullScreen();
    notifyListeners();
  }

  void toggleCaptionFullScreen() {
    _isCaptionFullScreen = !_isCaptionFullScreen;
    notifyListeners();
  }
}
