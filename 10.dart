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

  task.dcat((txt) {
    print("${DateTime.now().toString()} : $txt");
    return 0;
  });

  Future<void> _handleError(String path) async {
    if (await FileSystemEntity.isDirectory(path)) {
      stderr.writeln('error: $path is a directory');
    } else {
      exitCode = 2;
    }
  }
}