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

  Vector3.zero() {
    this.x = 0;
    this.y = 0;
    this.z = 0;
  }

  String toString() {
    return "Vector3(${x}, ${y}, ${z})";
  }

  Vector3 setTo(Vector3 vec) {
    x = vec.x;
    y = vec.y;
    z = vec.z;
    return this;
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

  Vector3 operator -(Vector3 vec) {
    return Vector3(x - vec.x, y - vec.y, z - vec.z);
  }

  Vector3 operator +(Vector3 vec) {
    return Vector3(x + vec.x, y + vec.y, z + vec.z);
  }

  Vector3 operator *(Vector3 vec) {
    return Vector3(x * vec.x, y * vec.y, z * vec.z);
  }

  // We can override according to return type in C++, not sure how to do that in Dart, so I'm using a different symbol
  double operator &(Vector3 dir) {
    double result = 0.0;

    result += x * dir.x;
    result += y * dir.y;
    result += z * dir.z;

    return result;
  }
}
