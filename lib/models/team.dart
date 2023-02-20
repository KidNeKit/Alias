class Team {
  static int _lastPosition = 0;

  final int _position;
  String _name;
  int _points;

  Team({required int position, required String name, required int points})
      : _name = name,
        _position = position,
        _points = points {
    _lastPosition++;
  }

  Team.initial()
      : _name = '',
        _position = _lastPosition,
        _points = 0 {
    _lastPosition++;
  }

  String get name => _name;
  int get position => _position;
  int get points => _points;

  set setName(String name) => _name = name;
  set setPoints(int points) => _points = points;

  static void resetLastPosition() {
    _lastPosition = 0;
  }

  static void reduceLastPosition() {
    _lastPosition--;
  }

  @override
  String toString() {
    return 'name: $_name, position: $_position, points: $_points';
  }
}
