import 'dart:math';
import 'package:image/image.dart';
import 'pixel.dart';
import 'vector.dart';
import 'sphere.dart';
import 'postprocessor.dart';
import 'material.dart';
import 'lighting.dart';

/**
 * Draw spheres, with ligthing.
 * Save it as a PNG.
 * Open it via the default Mac app.
 */

Vector3 point, N; // point is aka hit
double diffuse_light_intensity = 0.0;
Material material = Material(Pixel(0, 0, 128));

void main() {
  const filename = "drawlighting.png";
  const width = 1024;
  const height = 768;
  const FOV = pi / 2.0;

  List<Pixel> pixels = List<Pixel>(width * height);
  Image im = Image(width, height);

  // Image is prepped - draw!
  Material ivory = Material(Pixel.fromFraction(0.4, 0.4, 0.3));
  Material red_rubber = Material(Pixel.fromFraction(0.3, 0.1, 0.1));

  List<Sphere> spheres = List<Sphere>();

  spheres.add(Sphere(Vector3(-3, 0, -16), 2.0, ivory));
  spheres.add(Sphere(Vector3(-1, -1.5, -12), 2.0, red_rubber));
  spheres.add(Sphere(Vector3(1.5, -0.5, -18), 3.0, red_rubber));
  spheres.add(Sphere(Vector3(7, 5, -18), 4.0, ivory));

  List<Lighting> lights = List<Lighting>();
  lights.add(Lighting(Vector3(-20, 20, 20), 1.5));

  // Ray casting is triggered from here
  for (var x = 0; x < width; x++) {
    for (var y = 0; y < height; y++) {
      double xp = (2 * (x + 0.5) / width - 1) * tan(FOV / 2.0) * width / height;
      double yp = -(2 * (y + 0.5) / height - 1) * tan(FOV / 2.0);
      Vector3 direction = Vector3(xp, yp, -1).normalise();
      pixels[x + (y * width)] =
          castRay(Vector3(0, 0, 0), direction, spheres, lights);
    }
  }

  PostProcessor.performPostProcesses(im, pixels, filename);
}

bool sceneIntersect(Vector3 origin, Vector3 direction, List<Sphere> spheres,
    Material material) {
  double spheresDistance = double.maxFinite;

  for (var i = 0; i < spheres.length; i++) {
    double dist_i = 0.0;

    if (spheres[i].rayIntersect(origin, direction, dist_i) &&
        (dist_i < spheresDistance)) {
      spheresDistance = dist_i;
      point = origin + direction.timesDouble(dist_i);
      N = (point - spheres[i].center);
      N = N.normalise();
      material.setDiffuseColour(spheres[i].material.diffuseColour);
    }
  }

  return spheresDistance < 1000;
}

Pixel castRay(Vector3 origin, Vector3 direction, List<Sphere> spheres,
    List<Lighting> lights) {

  if (!sceneIntersect(origin, direction, spheres, material)) {
    return Pixel.fromFraction(0.2, 0.7, 0.8);
  }

  diffuse_light_intensity = 0.0; // important to reset between casts

  for (var i = 0; i < lights.length; i++) {
    Vector3 lightdir = (lights[i].position - point);
    lightdir = lightdir.normalise();

    diffuse_light_intensity += lights[i].intensity * max(0.0, lightdir & N);
  }

  return material.timesDouble(diffuse_light_intensity);
}