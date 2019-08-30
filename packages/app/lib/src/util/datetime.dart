/// Check if the supplied [dateTime] is in the future or within the current hour of [startTime].
///
/// If [startTime] is not supplied it will default to [DateTime.now()]
bool currentHourOrFuture(
  DateTime dateTime, {
  DateTime startTime,
}) {
  final now = startTime ?? DateTime.now();
  final after = dateTime.isAfter(now);
  final sameHour = dateTime.day == now.day && dateTime.hour == now.hour;

  return sameHour || after;
}
