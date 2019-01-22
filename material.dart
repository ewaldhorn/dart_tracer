import 'pixel.dart';

class Material {
  Pixel diffuseColour;

  Material(Pixel colour) {
    this.diffuseColour = colour;
  }

  void setDiffuseColour(Pixel p) {
    diffuseColour = p;
  }
}
