import 'dart:io';
import 'dart:convert';

class Task {
  bool readFromInput;
  bool showLineNumbers;
  List<String> paths;

  Task(this.readFromInput, this.showLineNumbers, this.paths);

  Task.fromInput()
      : readFromInput = true,
        showLineNumbers = false,
        paths = [];

  Future<void> dcat(
    String Function(String) log,
  ) async {
    print(log("Job started!"));
    ...
    print(log("Job completed!"));
  }
  Future<void> _handleError(String path) async {
    if (await FileSystemEntity.isDirectory(path)) {
      stderr.writeln('error: $path is a directory');
    } else {
      exitCode = 2;
    }
  }
}