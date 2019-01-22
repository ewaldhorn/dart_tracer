import 'vector.dart';

class Lighting {
  Vector3 position;
  double intensity;

  Lighting(Vector3 position, double intensity) {
    this.position = position;
    this.intensity = intensity;
  }
}