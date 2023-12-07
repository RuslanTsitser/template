import 'dart:async';
import 'dart:developer' show log;

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

export 'app_bloc_observer.dart';
export 'app_navigator_observer.dart';
export 'change_notifier_observer.dart';

final _logger = Logger(
  output: ConsoleOutput(
    truncate: false,
  ),
  printer: PrettyPrinter(
    colors: true,
    printTime: false,
    printEmojis: false,
    noBoxingByDefault: false,
    lineLength: 80,
  ),
);

Logger get _truncateLogger => Logger(
      output: ConsoleOutput(
        truncate: true,
      ),
      printer: PrettyPrinter(
        colors: true,
        printTime: false,
        printEmojis: false,
        noBoxingByDefault: false,
        lineLength: 80,
      ),
    );

bool get _enableLogger => true;

bool get _showBLOC => true;
bool get _showAppRouter => true;
bool get _showRestApi => true;
bool get _showChangeNotifier => true;
bool get _showMetrica => true;
bool get _showAds => true;
bool get _showAbTest => true;
bool get _showLocalStorage => true;
bool get _showFirebase => true;

void logData(dynamic data) => _logger.t(data);

void logInfo(dynamic data) => _logger.i(data);

StreamController<({dynamic message, StackTrace? stackTrace, dynamic error})> _logStreamController =
    StreamController.broadcast();
void _logErrorSink(dynamic data, [dynamic error, StackTrace? stackTrace]) {
  final message = (message: data, stackTrace: stackTrace, error: error);
  _logStreamController.add(message);
}

Stream<({dynamic message, StackTrace? stackTrace, dynamic error})> get logStream => _logStreamController.stream;

void logError(dynamic data, [dynamic error, StackTrace? stackTrace]) {
  _logger.e(data, error: error, stackTrace: stackTrace);
  _logErrorSink(data, error, stackTrace);
}

// BLOC logs
void logBlOC(dynamic data) => _showBLOC ? _logger.i(data) : null;
void logErrorBlOC(dynamic data, [dynamic error, StackTrace? stackTrace]) {
  _showBLOC ? _logger.e(data, error: error, stackTrace: stackTrace) : null;
  _showBLOC ? _logErrorSink(data, error, stackTrace) : null;
}

// APP ROUTER logs
void logAppRouter(dynamic data) => _showAppRouter ? _logger.i(data) : null;

// REST API logs
void logRestApi(dynamic data) => _showRestApi ? _truncateLogger.i(data) : null;
void logErrorRestApi(dynamic data, [dynamic error, StackTrace? stackTrace]) {
  _showRestApi ? _logger.e(data, error: error, stackTrace: stackTrace) : null;
  _showRestApi ? _logErrorSink(data, error, stackTrace) : null;
}

// Change notifier logs
void logChangeNotifier(dynamic data) => _showChangeNotifier ? _logger.i(data) : null;

// Metrica logs
void logMetrica(dynamic data) => _showMetrica ? _logger.i(data) : null;

// Ad logs
void logAds(dynamic data) => _showAds ? _logger.i(data) : null;

// Ad logs
void logAbTest(dynamic data) => _showAbTest ? _logger.i(data) : null;
void logErrorAbTest(dynamic data, [dynamic error, StackTrace? stackTrace]) {
  _showAbTest ? _logger.e(data, error: error, stackTrace: stackTrace) : null;
  _showAbTest ? _logErrorSink(data, error, stackTrace) : null;
}

// LocalStorage logs
void logLocalStorage(dynamic data) => _showLocalStorage ? _logger.i(data) : null;
void logErrorLocalStorage(dynamic data, [dynamic error, StackTrace? stackTrace]) {
  _showLocalStorage ? _logger.e(data, error: error, stackTrace: stackTrace) : null;
  _showLocalStorage ? _logErrorSink(data, error, stackTrace) : null;
}

// Firebase logs
void logFirebase(dynamic data) => _showFirebase ? _logger.i(data) : null;
void logErrorFirebase(dynamic data, [dynamic error, StackTrace? stackTrace]) {
  _showFirebase ? _logger.e(data, error: error, stackTrace: stackTrace) : null;
  _showFirebase ? _logErrorSink(data, error, stackTrace) : null;
}

class ConsoleOutput extends LogOutput {
  final int lineLength;
  final bool truncate;
  ConsoleOutput({this.lineLength = 80, this.truncate = true});
  @override
  void output(OutputEvent event) {
    List<String> lines = [...event.lines];
    if (lines.length > lineLength && truncate) {
      lines = lines.sublist(0, lineLength);
      lines.add('...');
    }
    if (_enableLogger) {
      if (kIsWeb) {
        for (var element in lines) {
          log(element);
        }
      } else {
        log(lines.join('\n'));
      }
    }
  }
}
