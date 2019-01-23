import 'package:test/test.dart';
import 'pixel.dart';

void main() {
  group("Pixel", () {
    test("Can create a pixel.", () {
      Pixel p = Pixel(0.1, 0.2, 0.3);
      expect(p.r, equals(0.1));
      expect(p.g, equals(0.2));
      expect(p.b, equals(0.3));
    });
    test("Can create a zero pixel.", () {
      Pixel p = Pixel.zero();
      expect(p.r, equals(0.0));
      expect(p.g, equals(0.0));
      expect(p.b, equals(0.0));
    });
    test("Can add positive to a pixel.", () {
      Pixel p = Pixel.zero();
      p.add(0.1, 0.11, 0.111);
      expect(p.r, equals(0.1));
      expect(p.g, equals(0.11));
      expect(p.b, equals(0.111));
    });
    test("Can add negative to a pixel.", () {
      Pixel p = Pixel(0.1, 0.11, 0.111);
      p.add(-0.1, -0.11, -0.111);
      expect(p.r, equals(0.0));
      expect(p.g, equals(0.0));
      expect(p.b, equals(0.0));
    });
  });
}
