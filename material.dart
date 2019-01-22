import 'pixel.dart';

class Material {
  Pixel diffuseColour;

  Material(Pixel colour) {
    this.diffuseColour = colour;
  }

  void setDiffuseColour(Pixel p) {
    diffuseColour = p;
  }

  timesDouble(double d) {
    return Pixel(this.diffuseColour.r * d, this.diffuseColour.g * d,
        this.diffuseColour.b * d);
  }
}
