import 'package:uuid/uuid.dart';

class TeamMemory {
  final String _id;
  String _name;
  //String _image;
  //other stats;

  TeamMemory.initial()
      : _id = const Uuid().v1(),
        _name = '';

  TeamMemory({required String id, required String name})
      : _id = id,
        _name = name;

  String get id => _id;

  set setName(String name) => _name = name;

  static TeamMemory fromJson(Map<String, dynamic> json) {
    return TeamMemory(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': _id, 'name': _name};
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
