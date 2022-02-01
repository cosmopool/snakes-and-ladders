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

  test('should return snake tail tile position 6 given roll position 16', () {
    int rollPosition = 16;
    Board board = Board();
    int finalPosition = board.isSnakeTile(rollPosition);

    expect(finalPosition, 6);
  });

  test('should return snake tail tile position 25 given roll position 46', () {
    int rollPosition = 46;
    Board board = Board();
    int finalPosition = board.isSnakeTile(rollPosition);

    expect(finalPosition, 25);
  });

  test('should return snake tail tile position 11 given roll position 49', () {
    int rollPosition = 49;
    Board board = Board();
    int finalPosition = board.isSnakeTile(rollPosition);

    expect(finalPosition, 11);
  });

  test('should return snake tail tile position 19 given roll position 62', () {
    int rollPosition = 62;
    Board board = Board();
    int finalPosition = board.isSnakeTile(rollPosition);

    expect(finalPosition, 19);
  });

  test('should return snake tail tile position 60 given roll position 64', () {
    int rollPosition = 64;
    Board board = Board();
    int finalPosition = board.isSnakeTile(rollPosition);

    expect(finalPosition, 60);
  });

  test('should return snake tail tile position 53 given roll position 74', () {
    int rollPosition = 74;
    Board board = Board();
    int finalPosition = board.isSnakeTile(rollPosition);

    expect(finalPosition, 53);
  });

  test('should return snake tail tile position 68 given roll position 89', () {
    int rollPosition = 89;
    Board board = Board();
    int finalPosition = board.isSnakeTile(rollPosition);

    expect(finalPosition, 68);
  });

  test('should return snake tail tile position 88 given roll position 92', () {
    int rollPosition = 92;
    Board board = Board();
    int finalPosition = board.isSnakeTile(rollPosition);

    expect(finalPosition, 88);
  });

  test('should return snake tail tile position 75 given roll position 95', () {
    int rollPosition = 95;
    Board board = Board();
    int finalPosition = board.isSnakeTile(rollPosition);

    expect(finalPosition, 75);
  });

  test('should return snake tail tile position 80 given roll position 99', () {
    int rollPosition = 99;
    Board board = Board();
    int finalPosition = board.isSnakeTile(rollPosition);

    expect(finalPosition, 80);
  });

}
