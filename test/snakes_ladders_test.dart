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
    print('player position before: ${game.player1.position}');
    
    // go to tile 46
    game.play(1, 3);
    print('player position after: ${game.player1.position}');

    expect(game.player1.position, 25);
  });
  test('', () {});
  test('', () {});
  test('should play again on double roll', () {});
}
