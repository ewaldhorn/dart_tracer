import 'pixel.dart';
import 'vector.dart';

class Material {
  Vector2 albedo;
  Pixel diffuseColour;
  double specularExponent;

  Material(Vector2 albedo, Pixel colour, double specularExponent) {
    this.albedo = albedo;
    this.diffuseColour = colour;
    this.specularExponent = specularExponent;
  }

  void setDiffuseColour(Pixel p) {
    diffuseColour = p;
  }

  Pixel timesDouble(double d) {
    diffuseColour.timesDouble(d);
    return diffuseColour;
  }
}
