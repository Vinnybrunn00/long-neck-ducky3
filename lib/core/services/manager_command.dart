import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:process_run/process_run.dart';

class ManagerCommand {
  final Shell shell = Shell(options: ShellOptions());

  Future<void> execCommand() async {
    final Directory documents = await getApplicationDocumentsDirectory();
    final Directory office = Directory('${documents.path}\\office');

    String command =
        "Start-Process -WindowStyle Hidden -FilePath '${office.path}\\setup.exe' -ArgumentList '/configure ${office.path}/config.xml' -Verb RunAs -Wait";

    await shell.run('powershell -Command "$command"');
    await office.delete(recursive: true);
  }
}
