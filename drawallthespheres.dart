import 'dart:math';
import 'package:image/image.dart';
import 'pixel.dart';
import 'vector.dart';
import 'sphere.dart';
import 'postprocessor.dart';
import 'material.dart';

/**
 * Draw a lot of spheres!
 * Save it as a PNG.
 * Open it via the default Mac app.
 */

void main() {
  const filename = "allthespheres.png";
  const width = 640;
  const height = 480;
  const FOV = pi / 2.0;

  List<Pixel> pixels = List<Pixel>(width * height);
  Image im = Image(width, height);

  // Image is prepped - draw!
  Material ivory = Material(Vector2(1.0, 1.0), Pixel(0.4, 0.4, 0.3), 10);
  Material red_rubber = Material(Vector2(1.0, 1.0), Pixel(0.3, 0.1, 0.1), 10);

  List<Sphere> spheres = List<Sphere>();

  spheres.add(Sphere(Vector3(-3, 0, -16), 2.0, ivory));
  spheres.add(Sphere(Vector3(-1, -1.5, -12), 2.0, red_rubber));
  spheres.add(Sphere(Vector3(1.5, -0.5, -18), 3.0, red_rubber));
  spheres.add(Sphere(Vector3(7, 5, -18), 4.0, ivory));

  // Ray casting is triggered from here
  for (var x = 0; x < width; x++) {
    for (var y = 0; y < height; y++) {
      double xp = (2 * (x + 0.5) / width - 1) * tan(FOV / 2.0) * width / height;
      double yp = -(2 * (y + 0.5) / height - 1) * tan(FOV / 2.0);
      Vector3 direction = Vector3(xp, yp, -1).normalise();
      pixels[x + (y * width)] = castRay(Vector3(0, 0, 0), direction, spheres);
    }
  }

  PostProcessor.performPostProcesses(im, pixels, filename);
}

bool sceneIntersect(Vector3 origin, Vector3 direction, List<Sphere> spheres,
    Vector3 hit, Vector3 N, Material material) {
  double spheresDistance = double.maxFinite;

  for (var i = 0; i < spheres.length; i++) {
    double dist_i = 0.0;

    if (spheres[i].rayIntersect(origin, direction, dist_i) &&
        (dist_i < spheresDistance)) {
      spheresDistance = dist_i;
      hit.setTo(origin + direction.timesDouble(dist_i));
      N.setTo((hit - spheres[i].center).normalise());
      material.setDiffuseColour(spheres[i].material.diffuseColour);
    }
  }

  return spheresDistance < 1000;
}

Pixel castRay(Vector3 origin, Vector3 direction, List<Sphere> spheres) {
  Vector3 point = Vector3.zero(), N = Vector3.zero();
  Material material = Material(Vector2(0, 0), Pixel(0, 0, 128), 0);

  if (!sceneIntersect(origin, direction, spheres, point, N, material)) {
    return Pixel(0.2, 0.7, 0.8);
  }

  return material.diffuseColour;
}
