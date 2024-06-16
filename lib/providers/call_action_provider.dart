import 'package:flutter/material.dart';

class CallActionProvider extends ChangeNotifier {
  bool _isMicOn = false;
  bool _isVideoOn = false;
  bool _isCaptionOn = false;
  bool _isWriting = false;
  bool _isCaptionFullScreen = false;
  bool _isShareScreen = false;

  bool get isMicOn => _isMicOn;
  bool get isVideoOn => _isVideoOn;
  bool get isCaptionOn => _isCaptionOn;
  bool get isWriting => _isWriting;
  bool get isCaptionFullScreen => _isCaptionFullScreen;
  bool get isShareScreen => _isShareScreen;

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

  void toggleShareScreen() {
    _isShareScreen = !_isShareScreen;
    notifyListeners();
  }
}
