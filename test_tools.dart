// Double precision numbers are not so precise after all. A very close match is good enough for us though.
bool isAcceptable(double d1, double d2) {
  return (d1 - d2).abs() <= 0.0000000001;
}
