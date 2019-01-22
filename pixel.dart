class Pixel {
  double r, g, b;

  Pixel(double r, double g, double b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }

  static int toPixelValue(double val) {
    return val.toInt().clamp(0, 255);
  }
}
