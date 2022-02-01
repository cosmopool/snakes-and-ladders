import 'package:flutter_test/flutter_test.dart';
import 'package:snakes_and_ladders/entities/board.dart';
import 'package:snakes_and_ladders/entities/player.dart';
import 'package:snakes_and_ladders/entities/snakes_ladders.dart';

void main() {
  Board board = Board();

  test('should increase player position by 36 when hit ladder 1 tile', () {
    Player player = Player.onPosition(0, 1);
    SnakesLadders game = SnakesLadders(board, player, player);

    // go to tile 2
    game.play(1, 1);

    expect(game.player1.position, 38);
  });

  test('should increase player position by 7 when hit ladder 2 tile', () {
    Player player = Player.onPosition(0, 1);
    SnakesLadders game = SnakesLadders(board, player, player);

    // go to tile 7
    game.play(1, 6);

    expect(game.player1.position, 14);
  });

  test('should decrease player position by 10 when hit snake 1 tile', () {
    Player player = Player.onPosition(14, 1);
    SnakesLadders game = SnakesLadders(board, player, player);

    // go to tile 16
    game.play(1, 1);

    expect(game.player1.position, 6);
  });

  test('should decrease player position by 21 when hit snake 2 tile', () {
    Player player = Player.onPosition(42, 1);
    SnakesLadders game = SnakesLadders(board, player, player);

    // go to tile 46
    game.play(1, 3);

    expect(game.player1.position, 25);
  });

  test('player sould remain on empty tile when no title left to move', () {
    Player player = Player.onPosition(0, 1);
    SnakesLadders game = SnakesLadders(board, player, player);

    // go to tile 3
    game.play(2, 1);

    expect(game.player1.position, 3);
  });

  test('should play again on double dice', () {
    Player player1 = Player(1);
    Player player2 = Player(2);
    SnakesLadders game = SnakesLadders(board, player1, player2);
    
    // go to tile 46
    game.play(1, 1);

    expect(game.playerTurn, 1);
  });

  test('should pass turn on no double dice', () {
    Player player1 = Player(1);
    Player player2 = Player(2);
    SnakesLadders game = SnakesLadders(board, player1, player2);
    
    game.play(1, 2);

    expect(game.playerTurn, 2);
  });

  test('should decrease player position when hit final tile but still has tiles left to move', () {});
  test('should win the game when hit the final tile with no tiles left to move', () {});

  test('should win the game when hit the final tile with double dice', () {});

  test('should win the game when hit the final tile with no double dice', () {});
}
