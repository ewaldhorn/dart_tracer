import 'dart:math';

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
    return Vector3(this.x * t, this.y * t, this.z * t);
  }

  timesDouble(double d) {
    return Vector3(this.x * d, this.y * d, this.z * d);
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

    result = this.x * dir.x;
    result += this.y * dir.y;
    result += this.z * dir.z;

    return result;
  }
}
