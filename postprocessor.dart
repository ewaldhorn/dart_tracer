import 'dart:io';
import 'package:image/image.dart';
import 'openfile.dart';
import 'pixel.dart';

/**
 * Handles all our post-processing work, like saving the file to disk.
 */

class PostProcessor {
  static performPostProcesses(
      Image srcImage, List<Pixel> pixels, String filename) {
    // Convert to pixels
    List imagePixels = srcImage.getBytes();
    var pixelpos = 0;
    var maxsize = srcImage.width * srcImage.height * 4;
    for (var pos = 0; pos < maxsize; pos += 4) {
      var pix = pixels[pixelpos];

      imagePixels[pos] = Pixel.toPixelValue(pix.r);
      imagePixels[pos + 1] = Pixel.toPixelValue(pix.g);
      imagePixels[pos + 2] = Pixel.toPixelValue(pix.b);
      imagePixels[pos + 3] = 255;

      pixelpos += 1;
    }

    Image image = Image.fromBytes(srcImage.width, srcImage.height, imagePixels);

    // Done Drawing, now save it.
    List<int> png = encodePng(image);
    new File(filename).writeAsBytesSync(png);

    // Open the file in the Mac previewer
    OpenFile().openFileInPreview(filename);
  }
}
