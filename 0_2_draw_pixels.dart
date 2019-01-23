import 'dart:io';
import 'dart:math';
import 'package:image/image.dart';
import 'openfile.dart';

/**
 * Create and populate an image with random pixels.
 * Save it as a PNG.
 * Open it via the default Mac app.
 */

void main() {
  const width = 640;
  const height = 480;
  const maxColourValue = 256;
  Image image = Image(width, height);

  var rnd = Random();

  fill(image, getColor(255, 255, 255));
  // Image is prepped - draw!

  for (var x = 0; x < width; x++) {
    for (var y = 0; y < height; y++) {
      var r = rnd.nextInt(maxColourValue);
      var g = rnd.nextInt(maxColourValue);
      var b = rnd.nextInt(maxColourValue);
      drawPixel(image, x, y, getColor(r, g, b));
    }
  }

  // Done Drawing, now save it.
  List<int> png = encodePng(image);
  new File('output_randompixels.png').writeAsBytesSync(png);

  // Open the file in the Mac previewer
  OpenFile().openFileInPreview('output_randompixels.png');
}
