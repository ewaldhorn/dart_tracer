import 'package:test/test.dart';
import 'test_tools.dart';
import 'vector.dart';

void main() {
  group("Vector2", () {
    test("Can create a Vector2.", (){
      Vector2 v = Vector2(10, 20);

      expect(v.x, equals(10));
      expect(v.y, equals(20));
    });
  });
}