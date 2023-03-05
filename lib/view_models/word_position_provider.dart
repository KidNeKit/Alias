import 'package:flutter/material.dart';

import 'turn_view_model.dart';

class WordPositionProvider with ChangeNotifier {
  Size _size = Size.zero;
  Offset _startPosition = Offset.zero;
  Offset _offset = Offset.zero;
  bool _isDragging = false;

  late TurnViewModel _turnViewModel;

  Offset get startPosition => _startPosition;
  Offset get position => _offset;
  bool get isDragging => _isDragging;

  set setScreenSize(Size size) => _size = size;
  set setTurnViewModel(TurnViewModel turnViewModel) =>
      _turnViewModel = turnViewModel;

  void setStartPosition(DragStartDetails details) {
    _isDragging = true;
    _startPosition = Offset(details.localPosition.dx, details.localPosition.dy);
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    if (_isDragging) {
      _offset += details.delta;
      final dy = _offset.dy;
      final freeHalf = (_size.height - 300) / 2;

      if (dy > 0.75 * freeHalf) {
        _turnViewModel.nextWord();
        endPosition();
      }

      if (dy < -0.75 * freeHalf) {
        _turnViewModel.markWordAsCorrect();
        endPosition();
      }
    }
    notifyListeners();
  }

  void endPosition() {
    _isDragging = false;
    resetPosition();
  }

  void resetPosition() {
    _isDragging = false;
    _startPosition = Offset.zero;
    _offset = Offset.zero;
    notifyListeners();
  }
}
