enum WinPoints {
  fifteen(15),
  twenty(20),
  thirty(30),
  fourty(40);

  final int value;

  const WinPoints(this.value);

  WinPoints findByValue(int value) =>
      values.firstWhere((element) => element.value == value);
}
