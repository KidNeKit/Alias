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
  double _spendPercentage = 1.0;

  late Sink _streamSink;

  String get currentWord => _packWords[_wordIndex];
  int get secondsLeft => _secondsLeft;
  double get spendPercentage => _spendPercentage;
  bool get isTurnBlocked => _isTurnBlocked;
  List<String> get correctWords => _correctWords;
  List<String> get shownWords => _shownWords;

  set setGameViewModel(GameViewModel? gameViewModel) {
    if (gameViewModel != null) {
      _packWords.clear();
      _packWords.addAll([...gameViewModel.packWords]..shuffle());
      _streamSink = gameViewModel.turnResults.sink;
    }
  }

  void refreshState() {
    _secondsLeft = _initialTurnTime;
    _spendPercentage = 1.0;
    _wordIndex = 0;
    _isTurnBlocked = false;
    _packWords.shuffle();
    _shownWords.clear();
    _correctWords.clear();
  }

  void startTurn() {
    log('start turn');
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
    Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        _spendPercentage =
            (_initialTurnTime - (0.1 * timer.tick)) / _initialTurnTime;
        if (_secondsLeft == 0) {
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
      _shownWords.add(currentWord);
      notifyListeners();
    } else {
      log('turn ended');
    }
  }

  void endTurn() {
    _streamSink.add(_correctWords.length);
    refreshState();
  }

  void thumbUpPressed(String word) {
    if (_correctWords.contains(word)) {
      _correctWords.remove(word);
    } else {
      _correctWords.add(word);
    }
    notifyListeners();
  }

  @override
  String toString() {
    return '$shownWords';
  }
}
