import 'dart:io';
import 'package:image/image.dart';
import 'openfile.dart';
import 'pixel.dart';

/**
 * Create and populate an array with gradient of pixels.
 * Save it as a PNG.
 * Open it via the default Mac app.
 */

void main() {
  const width = 1024;
  const height = 768;

  List<Pixel> pixels = List<Pixel>(width * height);
  Image im = Image(width, height);
  List imagePixels = im.getBytes();

  // Image is prepped - draw!

  for (var x = 0; x < width; x++) {
    for (var y = 0; y < height; y++) {
      var r = y.toDouble() / width.toDouble();
      var g = x.toDouble() / height.toDouble();
      var b = 0.0;
      pixels[x + (y * width)] = Pixel(r, g, b);
    }
  }

  var pixelpos = 0;
  var maxsize = width * height * 4;
  for (var pos = 0; pos < maxsize; pos += 4) {
    var pix = pixels[pixelpos];

    imagePixels[pos] = Pixel.toPixelValue(pix.r);
    imagePixels[pos + 1] = Pixel.toPixelValue(pix.g);
    imagePixels[pos + 2] = Pixel.toPixelValue(pix.b);
    imagePixels[pos + 3] = 255;

    pixelpos += 1;
  }

  Image image = Image.fromBytes(width, height, imagePixels);

  // Done Drawing, now save it.
  List<int> png = encodePng(image);
  new File('output_gradient.png').writeAsBytesSync(png);

  // Open the file in the Mac previewer
  OpenFile().openFileInPreview('output_gradient.png');
}
