import 'dart:math';
import 'vector.dart';
import 'material.dart';

class Sphere {
  Vector3 center;
  double radius;
  Material material;

  Sphere(Vector3 center, double radius, Material material) {
    this.center = center;
    this.radius = radius;
    this.material = material;
  }

  bool rayIntersect(Vector3 origin, Vector3 direction, double t0) {
    Vector3 l = center - origin;
    double tca = l & direction;
    double d2 = (l & l) - (tca * tca);

    if (d2 > radius * radius) return false;

    double thc = sqrt(radius * radius - d2);
    t0 = tca - thc;
    double t1 = tca + thc;

    if (t0 < 0) t0 = t1;
    if (t0 < 0) return false;

    return true;
  }
}
