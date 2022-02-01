import 'package:flutter_test/flutter_test.dart';
import 'package:snakes_and_ladders/entities/dice.dart';

void main() {
  test('dice should return number between 1 and 6', () {
    int max = 6;
    bool roll = true;
    Dice dice = Dice();

    List.generate(40, (_) {
      int _roll = dice.roll();
      if (_roll < 1 || _roll > max) roll = false;
    });

    expect(true, roll);
  });
}
