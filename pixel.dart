class Pixel {
  double r, g, b;

  Pixel(double r, double g, double b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }

  Pixel.fromFraction(double r, double g, double b) {
    this.r = 255 * r;
    this.g = 255 * g;
    this.b = 255 * b;
  }

  static int toPixelValue(double val) {
    return val.toInt().clamp(0, 255);
  }

  @override
  String toString() {
    return "Instance of Pixel(${r},${g},${b})";
  }
}
