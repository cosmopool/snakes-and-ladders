import 'package:flutter_test/flutter_test.dart';
import 'package:snakes_and_ladders/entities/board.dart';
import 'package:snakes_and_ladders/entities/player.dart';
import 'package:snakes_and_ladders/entities/snakes_ladders.dart';

void main() {
  Board board = Board();

  test('should increase player position by 36 when hit ladder 1 tile', () {
    Player player = Player.onPosition(0);
    SnakesLadders game = SnakesLadders(board, player, player);
    
    // go to tile 2
    game.play(1, 1);

    expect(game.player1.position, 38);
  });

  test('player sould remain on empty tile when no title left to walk', () {
    Player player = Player.onPosition(0);
    SnakesLadders game = SnakesLadders(board, player, player);

    // go to tile 3
    game.play(2, 1);

    expect(game.player1.position, 3);
  });

  test('should decrease player position when hit final tile and still has tiles left to walk', () {});
  test('should increase player position by 7 when hit ladder 2 tile', () {});
  test('should decrease player position by 10 when hit snake 1 tile', () {});
  test('should decrease player position by 21 when hit snake 2 tile', () {});
  test('', () {});
  test('', () {});
  test('should play again on double roll', () {});
}
