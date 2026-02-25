import 'dart:io';
import 'package:background_downloader/background_downloader.dart';
import 'package:long_neck_duck3/constants/constants_url.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ManagerOffice {
  final String _filename;
  final String _content;

  ManagerOffice({required String filename, required String content})
    : _filename = filename,
      _content = content;

  Future<Directory> _createPathOffice() async {
    await Permission.manageExternalStorage.request();

    final Directory documents = await getApplicationDocumentsDirectory();

    final Directory office = Directory('${documents.path}\\office');

    if (!await office.exists()) {
      await office.create(recursive: true);
    }
    return office;
  }

  Future<void> download() async {
    final Directory office = await _createPathOffice();

    final String url = '$baseUrl\\$_content';

    final DownloadTask download = DownloadTask(
      url: url,
      filename: _filename,
      requiresWiFi: true,
      directory: office.path,
    );

    await FileDownloader().download(download);
  }
}
