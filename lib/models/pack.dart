import 'complexity.dart';

class Pack {
  //final String _id;
  final String _name;
  final Set<Complexity> _levels;

  Pack(
      { //required String id,
      required String name,
      required Set<Complexity> levels})
      : //_id = id,
        _name = name,
        _levels = levels;

  //String get id => _id;
  String get name => _name;
  Set<Complexity> get levels => _levels;

  static Pack fromJson(Map<String, dynamic> json) {
    return Pack(
        name: json['packName'],
        levels: (json['levels'] as List)
            .map((e) => Complexity.fromJson(e))
            .toSet());
  }

  @override
  String toString() {
    return 'name: $_name, levels: $_levels';
  }
}
