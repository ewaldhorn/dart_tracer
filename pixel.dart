class Pixel {
  double r, g, b;

  Pixel(double r, double g, double b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }

  Pixel operator +(Pixel p) {
    r += p.r;
    g += p.g;
    b += p.b;
    return this;
  }

  Pixel timesDouble(double d) {
    r *= d;
    g *= d;
    b *= d;
    return this;
  }

  Pixel combineWith(Pixel p) {
    r + p.r;
    g + p.g;
    b + p.b;
    return this;
  }

  static int toPixelValue(double val) {
    return (255 * val).clamp(0, 255).toInt();
  }

  @override
  String toString() {
    return "Instance of Pixel(${r},${g},${b})";
  }
}
