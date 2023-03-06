import 'package:uuid/uuid.dart';

class TeamMemory {
  final String _id;
  String _name;
  //String _image;
  int _gamesQuantity;
  int _gamesWon;
  //other stats;

  TeamMemory.initial()
      : _id = const Uuid().v1(),
        _name = '',
        _gamesQuantity = 0,
        _gamesWon = 0;

  TeamMemory(
      {required String id,
      required String name,
      required int gamesQuantity,
      required int gamesWon})
      : _id = id,
        _name = name,
        _gamesQuantity = gamesQuantity,
        _gamesWon = gamesWon;

  String get id => _id;
  String get name => _name;
  int get gamesQuantity => _gamesQuantity;
  int get gamesWon => _gamesWon;

  set setName(String name) => _name = name;

  static TeamMemory fromJson(Map<String, dynamic> json) {
    return TeamMemory(
        id: json['id'],
        name: json['name'],
        gamesQuantity: json['gamesQuantity'],
        gamesWon: json['gamesWon']);
  }

  void markAsWinner() {
    _gamesQuantity++;
    _gamesWon++;
  }

  void markAsLoser() {
    _gamesQuantity++;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'name': _name,
      'gamesQuantity': _gamesQuantity,
      'gamesWon': _gamesWon
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
