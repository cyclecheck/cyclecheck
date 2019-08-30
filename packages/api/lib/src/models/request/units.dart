class Unit {
  static const Unit METRIC = const Unit._('si');
  static const Unit IMPERIAL = const Unit._('us');
  static const Unit defaultUnit = METRIC;

  final String value;
  const Unit._(this.value);

  static Unit from(String string) {
    return string == Unit.IMPERIAL.value ? Unit.IMPERIAL : Unit.METRIC;
  }

  String toJson() => value;

  @override
  int get hashCode => value.hashCode;

  bool operator ==(Object other) => other is Unit && other.value == value;
}
