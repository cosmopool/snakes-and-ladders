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

  test('should increase player position by 7 when hit ladder 2 tile', () {
    Player player = Player.onPosition(0);
    SnakesLadders game = SnakesLadders(board, player, player);

    // go to tile 7
    game.play(1, 6);

    expect(game.player1.position, 14);
  });

  test('should decrease player position by 10 when hit snake 1 tile', () {
    Player player = Player.onPosition(14);
    SnakesLadders game = SnakesLadders(board, player, player);

    // go to tile 16
    game.play(1, 1);

    expect(game.player1.position, 6);
  });

  test('should decrease player position by 21 when hit snake 2 tile', () {
    Player player = Player.onPosition(42);
    SnakesLadders game = SnakesLadders(board, player, player);

    // go to tile 46
    game.play(1, 3);

    expect(game.player1.position, 25);
  });

  test('player sould remain on empty tile when no title left to move', () {
    Player player = Player.onPosition(0);
    SnakesLadders game = SnakesLadders(board, player, player);

    // go to tile 3
    game.play(2, 1);

    expect(game.player1.position, 3);
  });

  test('should return true on double dice', () {
    Player player = Player();
    SnakesLadders game = SnakesLadders(board, player, player);
    
    final isDoubleDice = game.isDoubleDice(4, 4);
    expect(isDoubleDice, true);
  });

  test('should return false on non double dice', () {
    Player player = Player();
    SnakesLadders game = SnakesLadders(board, player, player);
    
    final isDoubleDice = game.isDoubleDice(4, 3);
    expect(isDoubleDice, false);
  });

  test('should play again on double dice', () {
    Player player1 = Player();
    Player player2 = Player();
    SnakesLadders game = SnakesLadders(board, player1, player2);

    // go to tile 46
    game.play(1, 1);

    expect(game.playerTurn, 1);
  });

  test('should pass turn on no double dice', () {
    Player player1 = Player();
    Player player2 = Player();
    SnakesLadders game = SnakesLadders(board, player1, player2);

    game.play(1, 2);

    expect(game.playerTurn, 2);
  });

  test('position should never be greater then 100', () {
    Player player = Player.onPosition(94);
    SnakesLadders game = SnakesLadders(board, player, player);

    game.play(8, 2);

    expect(player.position, 96);
  });

  test('should win the game when hit the final tile with no double dice', () {
    Player player = Player.onPosition(97);
    SnakesLadders game = SnakesLadders(board, player, player);

    game.play(1, 2);

    expect(game.winner, player.id);
  });

  test('should win the game when hit the final tile with double dice', () {
    Player player = Player.onPosition(96);
    SnakesLadders game = SnakesLadders(board, player, player);

    game.play(2, 2);

    expect(game.winner, player.id);
  });

  test('should not be able to move when some player has won', () {
    Player player = Player.onPosition(96);
    SnakesLadders game = SnakesLadders(board, player, player);

    game.play(2, 2);
    game.play(2, 2);

    expect(player.position, 100);
  });

  test('should reset winner player on newGame', () {
    Player player = Player.onPosition(96);
    SnakesLadders game = SnakesLadders(board, player, player);

    game.play(2, 2);
    expect(game.winner, player.id);
    game.newGame();

    expect(game.winner, 0);
  });

  test('should reset player position on newGame', () {
    Player player = Player.onPosition(96);
    SnakesLadders game = SnakesLadders(board, player, player);

    game.play(2, 2);
    int oldPosition = player.position;
    game.newGame();

    expect((player.position != oldPosition), true);
  });
}
