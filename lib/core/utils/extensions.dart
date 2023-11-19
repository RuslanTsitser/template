import 'utils.dart';

extension StringExtension on String {
  String get truncate => truncateWithEllipsis(this);

  String get extractName => extractImageName(this);

  String get capitalized {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

extension DateTimeExtension on DateTime {
  DateTime get startOfDay => DateTime(year, month, day);
}

extension DurationExtension on Duration {
  String get formatDuration1h30m => getHumanReadableDuration(inSeconds);
}
