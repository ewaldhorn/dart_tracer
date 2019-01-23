import 'dart:math';

class Vector2 {
  double x, y;

  Vector2(double x, double y) {
    this.x = x;
    this.y = y;
  }
}

class Vector3 {
  double x, y, z;

  Vector3(double x, double y, double z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  String toString() {
    return "Instance of Vector3(${x}, ${y}, ${z})";
  }

  double norm() {
    return sqrt(x * x + y * y + z * z);
  }

  Vector3 normalise({double l = 1.0}) {
    double t = l / norm();
    x *= t; 
    y *= t; 
    z *= t;
    return this;
  }

  Vector3 timesDouble(double d) {
    x *= d;
    y *= d; 
    z *= d;
    return this;
  }

  operator -(Vector3 vec) {
    return Vector3(this.x - vec.x, this.y - vec.y, this.z - vec.z);
  }

  operator +(Vector3 vec) {
    return Vector3(this.x + vec.x, this.y + vec.y, this.z + vec.z);
  }

  operator *(Vector3 vec) {
    return Vector3(this.x * vec.x, this.y * vec.y, this.z * vec.z);
  }

  // We can override according to return type in C++, not sure how to do that in Dart, so I'm using a different symbol
  operator &(Vector3 dir) {
    double result = 0.0;

    result = x * dir.x;
    result += y * dir.y;
    result += z * dir.z;

    return result;
  }
}
