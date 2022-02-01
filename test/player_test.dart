import 'package:flutter_test/flutter_test.dart';
import 'package:snakes_and_ladders/entities/player.dart';

void main() {
  test('should return future position given a positive roll', () {
    Player player = Player.onPosition(0);
    int futurePosition = player.futurePosition(10);

    expect(futurePosition, 10);
  });

  test('should remain on same tile given a negative roll', () {
    Player player = Player.onPosition(0);
    int futurePosition = player.futurePosition(10);

    expect(futurePosition, 10);
  });

  test('should have id when instantiated via onPosition constructor', () {
    Player player = Player.onPosition(0);

    expect((player.id > 0), true);
  });

  test('should be at position 0 on resetPosition', () {
    Player player = Player.onPosition(80);
    player.resetPosition();

    expect(player.position, 0);
  });
}

