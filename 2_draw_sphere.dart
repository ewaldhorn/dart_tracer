import 'dart:io';
import 'dart:math';
import 'package:image/image.dart';
import 'openfile.dart';
import 'pixel.dart';
import 'vector.dart';
import 'sphere.dart';

/**
 * Draw a Sphere!
 * Save it as a PNG.
 * Open it via the default Mac app.
 */

void main() {
  const width = 1024;
  const height = 768;
  const FOV = pi / 2.0;

  List<Pixel> pixels = List<Pixel>(width * height);
  Image im = Image(width, height);

  // Image is prepped - draw!

  Sphere sphere = Sphere(Vector3(-3, 0, -16), 2.0, null);

  for (var x = 0; x < width; x++) {
    for (var y = 0; y < height; y++) {
      double xp = (2 * (x + 0.5) / width - 1) * tan(FOV / 2.0) * width / height;
      double yp = -(2 * (y + 0.5) / height - 1) * tan(FOV / 2.0);
      Vector3 direction = Vector3(xp, yp, -1).normalise();
      pixels[x + (y * width)] = castRay(Vector3(0, 0, 0), direction, sphere);
    }
  }

  // Convert to pixels
  List imagePixels = im.getBytes();
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
  new File('output_sphere.png').writeAsBytesSync(png);

  // Open the file in the Mac previewer
  OpenFile().openFileInPreview('output_sphere.png');
}

Pixel castRay(Vector3 origin, Vector3 direction, Sphere sphere) {
  double sphere_dist = double.maxFinite;

  if (!sphere.rayIntersect(origin, direction, sphere_dist)) {
    return Pixel(0.2, 0.7, 0.8); // background colour
  }

  return Pixel(0.4, 0.4, 0.3);
}
