import 'package:flutter_test/flutter_test.dart';
import 'package:snakes_and_ladders/entities/player.dart';

void main() {
  test('should return future position given a positive roll', () {
    Player player = Player.onPosition(0, 1);
    int futurePosition = player.futurePosition(10);

    expect(futurePosition, 10);
  });

  test('should remain on same tile given a negative roll', () {
    Player player = Player.onPosition(0, 1);
    int futurePosition = player.futurePosition(10);

    expect(futurePosition, 10);
  });

  test('should have id when instantiated via onPosition constructor', () {
    Player player = Player.onPosition(0, 1);

    expect(player.id, 1);
  });

  test('should return player number 2', () {
    Player player = Player(2);
    expect(player.id, 2);
  });

  test('should return player number 1', () {
    Player player = Player(1);
    expect(player.id, 1);
  });

  test('should be at position 0 on resetPosition', () {
    Player player = Player.onPosition(80, 1);
    player.resetPosition();

    expect(player.position, 0);
  });
}

