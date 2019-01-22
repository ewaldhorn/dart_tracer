import 'dart:io' as IO;
import 'package:image/image.dart';

/**
 * Create a blank image.
 * Save it as a PNG.
 * Open it via the default Mac app.
 */

void main() {
  Image image = Image(1024, 768);

  fill(image, getColor(255, 255, 255));

  List<int> png = encodePng(image);
  new IO.File('basic.png').writeAsBytesSync(png);

  IO.Process.run('open', ['-a','Preview', 'basic.png']);
}