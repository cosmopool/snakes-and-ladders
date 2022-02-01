import 'package:flutter_test/flutter_test.dart';
import 'package:snakes_and_ladders/entities/board.dart';

void main() {
  test('should return ladder final tile position 38 given roll position 2', () {
    int rollPosition = 2;
    Board board = Board();
    int finalPosition = board.isLadderTile(rollPosition);

    expect(finalPosition, 38);
  });

  test('should return ladder final tile position 14 given roll position 7', () {
    int rollPosition = 7;
    Board board = Board();
    int finalPosition = board.isLadderTile(rollPosition);

    expect(finalPosition, 14);
  });

  test('should return ladder final tile position 31 given roll position 8', () {
    int rollPosition = 8;
    Board board = Board();
    int finalPosition = board.isLadderTile(rollPosition);

    expect(finalPosition, 31);
  });

  test('should return ladder final tile position 26 given roll position 15', () {
    int rollPosition = 15;
    Board board = Board();
    int finalPosition = board.isLadderTile(rollPosition);

    expect(finalPosition, 26);
  });

  test('should return ladder final tile position 42 given roll position 21', () {
    int rollPosition = 21;
    Board board = Board();
    int finalPosition = board.isLadderTile(rollPosition);

    expect(finalPosition, 42);
  });

  test('should return ladder final tile position 84 given roll position 28', () {
    int rollPosition = 28;
    Board board = Board();
    int finalPosition = board.isLadderTile(rollPosition);

    expect(finalPosition, 84);
  });

  test('should return ladder final tile position 44 given roll position 36', () {
    int rollPosition = 36;
    Board board = Board();
    int finalPosition = board.isLadderTile(rollPosition);

    expect(finalPosition, 44);
  });

  test('should return ladder final tile position 67 given roll position 51', () {
    int rollPosition = 51;
    Board board = Board();
    int finalPosition = board.isLadderTile(rollPosition);

    expect(finalPosition, 67);
  });

  test('should return ladder final tile position 91 given roll position 71', () {
    int rollPosition = 71;
    Board board = Board();
    int finalPosition = board.isLadderTile(rollPosition);

    expect(finalPosition, 91);
  });

  test('should return ladder final tile position 98 given roll position 78', () {
    int rollPosition = 78;
    Board board = Board();
    int finalPosition = board.isLadderTile(rollPosition);

    expect(finalPosition, 98);
  });

  test('should return ladder final tile position 94 given roll position 87', () {
    int rollPosition = 87;
    Board board = Board();
    int finalPosition = board.isLadderTile(rollPosition);

    expect(finalPosition, 94);
  });

}

