import 'package:args/args.dart';
import 'package:dcat/dcat.dart';

const lineNumber = 'line-number';
var logs = <String>[];

Future<void> main(List<String> arguments) async {
  final parser = ArgParser();
  parser.addFlag(lineNumber, negatable: false, abbr: 'n');
  ArgResults argResults = parser.parse(arguments);
  final paths = argResults.rest;

  final readFromInput = paths.isEmpty;

  final task = Task(readFromInput, argResults[lineNumber], paths);

  await task.dcat(log);

  Iterable<String> upperCaseLogs = logs.map((t) => t.toUpperCase());
  print("All uppercase logs:");
  for (var e in upperCaseLogs) {
    print(e);
  }
}

String log(String txt) {
  String logTxt = "${DateTime.now().toString()} : $txt";
  logs.add(logTxt);
  return logTxt;
}