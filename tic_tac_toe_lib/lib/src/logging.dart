import 'package:logger/logger.dart';

Logger logger(Type type) => Logger(printer: CustomerPrinter(type.toString()), level: Level.trace);

class CustomerPrinter extends LogPrinter {
  final String className;
  CustomerPrinter(this.className);
  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.defaultLevelColors[event.level];
    final emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    final time = PrettyPrinter(printTime: true).getTime(event.time);
    final message = event.message;

    return [color!('$time $emoji $className: $message')];
  }
}
