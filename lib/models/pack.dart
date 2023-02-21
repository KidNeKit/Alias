import 'complexity.dart';

class Pack {
  //final String _id;
  final String _name;
  final List<Complexity> _levels;

  Pack(
      { //required String id,
      required String name,
      required List<Complexity> levels})
      : //_id = id,
        _name = name,
        _levels = levels;

  //String get id => _id;
  String get name => _name;
  List<Complexity> get levels => _levels;

  static Pack fromJson(Map<String, dynamic> json) {
    return Pack(
        name: json['packName'],
        levels: (json['levels'] as List)
            .map((e) => Complexity.fromJson(e))
            .toList());
  }

  @override
  String toString() {
    return 'name: $_name, levels: $_levels';
  }
}
