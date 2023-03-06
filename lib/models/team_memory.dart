import 'package:uuid/uuid.dart';

class TeamMemory {
  final String _id;
  String _name;
  //String _image;
  int _gamesQuantity;
  int _gamesWon;
  int _bestWinStreak;
  int _currentWinStreak;

  TeamMemory.initial()
      : _id = const Uuid().v1(),
        _name = '',
        _gamesQuantity = 0,
        _gamesWon = 0,
        _bestWinStreak = 0,
        _currentWinStreak = 0;

  TeamMemory(
      {required String id,
      required String name,
      required int gamesQuantity,
      required int gamesWon,
      required int bestWinStreak,
      required int currentWinStreak})
      : _id = id,
        _name = name,
        _gamesQuantity = gamesQuantity,
        _gamesWon = gamesWon,
        _bestWinStreak = bestWinStreak,
        _currentWinStreak = currentWinStreak;

  String get id => _id;
  String get name => _name;
  String get gamesStat => '$_gamesWon - ${_gamesQuantity - _gamesWon}';
  int get gamesQuantity => _gamesQuantity;
  int get gamesWon => _gamesWon;
  int get bestWinStreak => _bestWinStreak;
  int get currentWinStreak => _currentWinStreak;

  set setName(String name) => _name = name;

  static TeamMemory fromJson(Map<String, dynamic> json) {
    return TeamMemory(
      id: json['id'],
      name: json['name'],
      gamesQuantity: json['gamesQuantity'],
      gamesWon: json['gamesWon'],
      bestWinStreak: json['bestWinStreak'] ?? 0,
      currentWinStreak: json['currentWinStreak'] ?? 0,
    );
  }

  void markAsWinner() {
    _gamesQuantity++;
    _gamesWon++;
    _currentWinStreak++;
    if (_currentWinStreak > _bestWinStreak) {
      _bestWinStreak = _currentWinStreak;
    }
  }

  void markAsLoser() {
    _gamesQuantity++;
    _currentWinStreak = 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'name': _name,
      'gamesQuantity': _gamesQuantity,
      'gamesWon': _gamesWon,
      'bestWinStreak': _bestWinStreak,
      'currentWinStreak': _currentWinStreak,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
