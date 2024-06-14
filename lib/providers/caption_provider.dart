import 'package:flutter/material.dart';

class CaptionProvider extends ChangeNotifier {
  bool _isFullScreen = false;

  bool get isCaptionFullScreen => _isFullScreen;

  void toggleFullScreen() {
    _isFullScreen = !_isFullScreen;
  }
}
