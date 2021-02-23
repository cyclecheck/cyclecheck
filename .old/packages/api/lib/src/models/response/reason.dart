class Reason {
  static const Reason ALERTS = const Reason._('alerts');
  static const Reason PRECIPITATION = const Reason._('precipitation');
  static const Reason WINDY = const Reason._('windy');
  static const Reason TOO_WINDY = const Reason._('too-windy');
  static const Reason HOT = const Reason._('hot');
  static const Reason TOO_HOT = const Reason._('too-hot');
  static const Reason COLD = const Reason._('cold');
  static const Reason TOO_COLD = const Reason._('too-cold');
  static const Reason UVINDEX = const Reason._('uvindex');
  static const Reason UNKNOWN = const Reason._('');

  final String value;
  const Reason._(this.value);

  String toJson() => value;

  static Reason from(String value) {
    if (value == Reason.ALERTS.value)
      return Reason.ALERTS;
    else if (value == Reason.PRECIPITATION.value)
      return Reason.PRECIPITATION;
    else if (value == Reason.WINDY.value)
      return Reason.WINDY;
    else if (value == Reason.TOO_WINDY.value)
      return Reason.TOO_WINDY;
    else if (value == Reason.HOT.value)
      return Reason.HOT;
    else if (value == Reason.TOO_HOT.value)
      return Reason.TOO_HOT;
    else if (value == Reason.COLD.value)
      return Reason.COLD;
    else if (value == Reason.TOO_COLD.value)
      return Reason.TOO_COLD;
    else if (value == Reason.UVINDEX.value)
      return Reason.UVINDEX;
    else
      return Reason.UNKNOWN;
  }

  static List<Reason> fromList(List<String> list) =>
      list == null ? [] : list.map((reason) => Reason.from(reason)).toList();
}
