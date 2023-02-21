import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'game_view_model.dart';

class TurnViewModel with ChangeNotifier {
  static const int _initialTurnTime = 10;
  final List<String> _packWords = [];
  final List<String> _shownWords = [];
  final List<String> _correctWords = [];

  bool _isTurnBlocked = false;
  int _secondsLeft = _initialTurnTime;
  int _wordIndex = 0;

  String get currentWord => _packWords[_wordIndex];
  int get secondsLeft => _secondsLeft;
  double get secondsLeftPercentage => _secondsLeft / _initialTurnTime * 100;
  bool get isTurnBlocked => _isTurnBlocked;

  TurnViewModel({GameViewModel? gameViewModel}) {
    if (gameViewModel != null) {
      _packWords.addAll([...gameViewModel.packWords]);
    }
  }

  void _refreshState() {
    _secondsLeft = _initialTurnTime;
    _wordIndex = 0;
    _isTurnBlocked = false;
    _packWords.shuffle();
    _shownWords.clear();
    _correctWords.clear();
  }

  void startTurn() {
    _refreshState();
    _shownWords.add(currentWord);
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _secondsLeft--;
        if (_secondsLeft == 0) {
          _isTurnBlocked = true;
          timer.cancel();
        }
        notifyListeners();
      },
    );
  }

  void markWordAsCorrect() {
    _correctWords.add(currentWord);
    nextWord();
  }

  void nextWord() {
    if (!_isTurnBlocked) {
      _wordIndex++;
      notifyListeners();
    } else {
      log('turn ended');
    }
  }
}
