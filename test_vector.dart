import 'package:test/test.dart';
import 'test_tools.dart';
import 'vector.dart';

void main() {
  group("Vector2", () {
    test("Can create a Vector2.", () {
      Vector2 v = Vector2(10, 20);

      expect(v.x, equals(10));
      expect(v.y, equals(20));
    });
  });

  group("Vector3", () {
    test("Can create a zero Vector3.", () {
      Vector3 v = Vector3.zero();

      expect(v.x, equals(0.0));
      expect(v.y, equals(0.0));
      expect(v.z, equals(0.0));
    });

    test("Can create a Vector3.", () {
      var v = Vector3(1.1, 1.2, 1.3);

      expect(v.x, equals(1.1));
      expect(v.y, equals(1.2));
      expect(v.z, equals(1.3));
    });

    test("Can set a Vector3 to the values of another Vector3.", () {
      var v = Vector3.zero();
      var w = Vector3(1, 2, 3);
      v.setTo(w);

      w.x = 11;

      expect(v.x, equals(1));
      expect(v.y, equals(2));
      expect(v.z, equals(3));
    });

    test("Can get the norm for a Zero vector.", () {
      var v = Vector3.zero();
      expect(v.norm(), equals(0));
    });

    test("Can get the norm for a non-zero vector.", () {
      var v = Vector3(1, 2, 3); // 14
      expect(true, isAcceptable(v.norm(), 3.74165738677)); // sqrt(14)
    });
  });
}