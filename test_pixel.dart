import 'package:test/test.dart';
import 'test_tools.dart';
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
    test("Can call + on a pixel.", () {
      Pixel p = Pixel(0.1, 0.1, 0.1);
      Pixel q = Pixel(0.1, 0.2, 0.3);
      Pixel r = p + q;

      expect(true, isAcceptable(p.r, 0.2));
      expect(true, isAcceptable(p.g, 0.3));
      expect(true, isAcceptable(p.b, 0.4));

      expect(true, isAcceptable(q.r, 0.1));
      expect(true, isAcceptable(q.g, 0.2));
      expect(true, isAcceptable(q.b, 0.3));

      expect(true, isAcceptable(r.r, 0.2));
      expect(true, isAcceptable(r.g, 0.3));
      expect(true, isAcceptable(r.b, 0.4));
    });
    test("Can call whole number timesDouble on a pixel.", () {
      Pixel p = Pixel(0.1, 0.1, 0.1);
      Pixel q = p.timesDouble(2.0);

      expect(true, isAcceptable(p.r, 0.2));
      expect(true, isAcceptable(p.g, 0.2));
      expect(true, isAcceptable(p.b, 0.2));

      expect(true, isAcceptable(q.r, 0.2));
      expect(true, isAcceptable(q.g, 0.2));
      expect(true, isAcceptable(q.b, 0.2));
    });
    test("Can call fraction timesDouble on a pixel.", () {
      Pixel p = Pixel(0.5, 0.5, 0.5);
      Pixel q = p.timesDouble(0.5);

      expect(true, isAcceptable(p.r, 0.25));
      expect(true, isAcceptable(p.g, 0.25));
      expect(true, isAcceptable(p.b, 0.25));

      expect(true, isAcceptable(q.r, 0.25));
      expect(true, isAcceptable(q.g, 0.25));
      expect(true, isAcceptable(q.b, 0.25));
    });
    test("Can call positive combineWith on a pixel.", () {
      Pixel p = Pixel(0.1, 0.1, 0.1);
      Pixel q = Pixel(0.1, 0.2, 0.3);
      Pixel r = p.combineWith(q);

      expect(true, isAcceptable(p.r, 0.2));
      expect(true, isAcceptable(p.g, 0.3));
      expect(true, isAcceptable(p.b, 0.4));

      expect(true, isAcceptable(q.r, 0.1));
      expect(true, isAcceptable(q.g, 0.2));
      expect(true, isAcceptable(q.b, 0.3));

      expect(true, isAcceptable(r.r, 0.2));
      expect(true, isAcceptable(r.g, 0.3));
      expect(true, isAcceptable(r.b, 0.4));
    });
    test("Can call negative combineWith on a pixel.", () {
      Pixel p = Pixel(0.5, 0.6, 0.7);
      Pixel q = Pixel(-0.1, -0.2, -0.3);
      Pixel r = p.combineWith(q);

      expect(true, isAcceptable(p.r, 0.4));
      expect(true, isAcceptable(p.g, 0.4));
      expect(true, isAcceptable(p.b, 0.4));

      expect(true, isAcceptable(q.r, -0.1));
      expect(true, isAcceptable(q.g, -0.2));
      expect(true, isAcceptable(q.b, -0.3));

      expect(true, isAcceptable(r.r, 0.4));
      expect(true, isAcceptable(r.g, 0.4));
      expect(true, isAcceptable(r.b, 0.4));
    });

    test("Can call toPixelValue on a pixel.", () {
      var t = Pixel.toPixelValue(0.5);
      var u = Pixel.toPixelValue(1.0);

      expect(t, equals(127));
      expect(u, equals(255));
    });
  });
}
