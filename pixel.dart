class Pixel {
  double r, g, b;

  Pixel(double r, double g, double b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }

  operator + (Pixel p) {
    return Pixel(this.r + p.r, this.g + p.g, this.b + p.b);
  }

  timesDouble(double d) {
    return Pixel(this.r * d, this.g * d, this.b * d);
  }

  combineWith(Pixel p) {
    return Pixel(this.r + p.r, this.g + g, this.b + p.b);
  }

  static int toPixelValue(double val) {
    return (255 * val).clamp(0, 255).toInt();
  }

  @override
  String toString() {
    return "Instance of Pixel(${r},${g},${b})";
  }
}
