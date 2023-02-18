class Team {
  String _name;

  Team({required String name}) : _name = name;

  Team.initial() : _name = '';

  String get name => _name;
}
