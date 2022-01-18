import 'package:dcli/dcli.dart' as dcli;
import 'package:sidekick_core/sidekick_core.dart';

/// Executes flutter_tool via flutter_wrapper
int flutterw(
  List<String> args, {
  Directory? workingDirectory,
  dcli.Progress? progress,
}) {
  final workingDir =
      workingDirectory?.absolute ?? entryWorkingDirectory.absolute;
  final flutterw = repository.root.file('flutterw');

  print('Executing flutter wrapper ${flutterw.path} in ${workingDir.path}');
  final process = dcli.startFromArgs(
    flutterw.path,
    args,
    workingDirectory: workingDir.path,
    nothrow: true,
    progress: progress,
    terminal: progress == null,
  );
  return process.exitCode ?? -1;
}
