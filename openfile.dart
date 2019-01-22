import 'dart:io';

class OpenFile {
  openFileInPreview(String filename) {
    if (Platform.isMacOS) {
      // Open the file in the Mac previewer
      Process.run('open', ['-a', 'Preview', '${filename}']);
    } else {
      print("I don't know how to handle ${Platform.operatingSystem}");
    }
  }
}
