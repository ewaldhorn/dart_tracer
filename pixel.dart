class Pixel {
  double r, g, b;

  Pixel(double r, double g, double b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }

  Pixel.zero() {
    this.r = 0.0;
    this.g = 0.0;
    this.b = 0.0;
  }

  Pixel add(double ar, double ag, double ab) {
    r += ar;
    g += ag;
    b += ab;
    return this;
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
    r += p.r;
    g += p.g;
    b += p.b;
    return this;
  }

  Pixel setTo(Pixel p) {
    r = p.r;
    g = p.g;
    b = p.b;
    return this;
  }

  Pixel operator *(double d) {
    return Pixel(r * d, g * d, b * d);
  }

  static int toPixelValue(double val) {
    return (255 * val).clamp(0, 255).toInt();
  }

  @override
  String toString() {
    return "Instance of Pixel(${r},${g},${b})";
  }
}
