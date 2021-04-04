import 'package:flutter/widgets.dart';

const int DOWNLOAD_FILE_BYTES = 100000; // 0.1MB

class DownloadModel extends ChangeNotifier {
  /// Download progress
  /// min: 0.0 ~ max: 1.0
  double progress = 0.0;

  Future<void> download() async {
    for (int downloadedBytes = 0;
        downloadedBytes <= DOWNLOAD_FILE_BYTES;
        downloadedBytes++) {
      await Future.delayed(Duration(microseconds: 1));

      if (downloadedBytes % 100 == 0 ||
          downloadedBytes == DOWNLOAD_FILE_BYTES) {
        progress = downloadedBytes / DOWNLOAD_FILE_BYTES;
        notifyListeners();
      }
    }
  }
}
