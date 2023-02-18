class Team {
  static int _lastPosition = 0;

  int _position;
  String _name;

  Team({required int position, required String name})
      : _name = name,
        _position = position {
    _lastPosition++;
  }

  Team.initial()
      : _name = '',
        _position = _lastPosition {
    _lastPosition++;
  }

  String get name => _name;
  int get position => _position;

  set setName(String name) => _name = name;

  static void resetLastPosition() {
    _lastPosition = 0;
  }

  static void reduceLastPosition() {
    _lastPosition--;
  }

  @override
  String toString() {
    return 'name: $_name, position: $_position';
  }
}
