import 'dart:convert';

import '../domain/models/base_model.dart';

String tryGetStringMap(dynamic data) {
  if (data is BaseToJsonModel) {
    return getPrettyStringJson(data.toJson());
  }
  return data.toString();
}

String getPrettyStringJson(dynamic data) {
  const encoder = JsonEncoder.withIndent('  ');
  return encoder.convert(data);
}

String formatDuration(int sec) {
  final duration = Duration(seconds: sec);
  String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
  String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
  return '$minutes:$seconds';
}

String extractImageName(String fullImageName) {
  List<String> parts = fullImageName.split('_');
  if (parts.length > 1) {
    return parts.sublist(1).join('_');
  } else {
    return fullImageName;
  }
}

String truncateWithEllipsis(
  String myString, {
  int cutoff = 80,
  int checkLength = 100,
}) {
  return (myString.length <= cutoff) ? myString : '${myString.substring(0, cutoff)}...';
}

// 1h 30m or 1m 30s or 1m or 1s and if there is more than 1h then 1h 30m only
String getHumanReadableDuration(int duration) {
  final hours = duration ~/ 3600;
  final minutes = (duration % 3600) ~/ 60;
  final seconds = duration % 60;

  String result = '';
  if (hours > 0) {
    result += '${hours}h ';
  }
  if (minutes > 0 && hours < 1000) {
    result += '${minutes}m ';
  }
  if (seconds > 0 && hours == 0) {
    result += '${seconds}s';
  }

  return result.isEmpty ? '0s' : result.trim();
}
