import 'dart:io';
import 'dart:math';
import 'package:image/image.dart';
import 'openfile.dart';
import 'pixel.dart';

/**
 * Create and populate an array with random pixels.
 * Save it as a PNG.
 * Open it via the default Mac app.
 */

void main() {
  const width = 640;
  const height = 480;
  const maxColourValue = 256;

  List<Pixel> pixels = List<Pixel>(width * height);
  Image im = Image(width, height);
  List imagePixels = im.getBytes();

  var rnd = Random();

  // Image is prepped - draw!

  for (var x = 0; x < width; x++) {
    for (var y = 0; y < height; y++) {
      var r = rnd.nextInt(maxColourValue);
      var g = rnd.nextInt(maxColourValue);
      var b = rnd.nextInt(maxColourValue);
      pixels[x + (y*width)] = Pixel(r, g, b);
    }
  }

  var pixelpos = 0;  
  var maxsize = width * height * 4;
  for (var pos = 0; pos < maxsize; pos += 4) {
    var pix = pixels[pixelpos];

    imagePixels[pos] = pix.r;
    imagePixels[pos + 1] = pix.g;
    imagePixels[pos + 2] = pix.b;
    imagePixels[pos + 3] = 255;

    pixelpos += 1;
  }

  Image image = Image.fromBytes(width, height, imagePixels);

  // Done Drawing, now save it.
  List<int> png = encodePng(image);
  new File('arraypixels.png').writeAsBytesSync(png);

  // Open the file in the Mac previewer
  OpenFile().openFileInPreview('arraypixels.png');
}
