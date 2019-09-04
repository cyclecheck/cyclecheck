/// Check if the supplied [dateTime] is in the future or within the current hour of [startTime].
///
/// If [startTime] is not supplied it will default to [DateTime.now()]
bool isCurrentHourOrFuture(
  DateTime dateTime, {
  DateTime startTime,
}) {
  final start = startTime ?? DateTime.now();
  return isCurrentHour(dateTime, startTime: startTime) ||
      dateTime.isAfter(start);
}

bool isCurrentHour(
  DateTime dateTime, {
  DateTime startTime,
}) {
  final start = startTime ?? DateTime.now();
  return dateTime.year == start.year &&
      dateTime.month == start.month &&
      dateTime.day == start.day &&
      dateTime.hour == start.hour;
}
