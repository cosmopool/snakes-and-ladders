import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/entities/board.dart';
import 'package:snakes_and_ladders/entities/player.dart';
import 'package:snakes_and_ladders/entities/snakes_ladders.dart';

class CobrasEscadas extends ChangeNotifier {
  final SnakesLadders _game;
  final Board _board;
  late final Player player1;
  late final Player player2;
  int _winner = 0;

  CobrasEscadas(this._game, this._board) {
    player1 = _game.player1;
    player2 = _game.player2;
  }

  int get playerTurn => _game.playerTurn;

  void jogar(int dice1, int dice2) {
    if (_winner == 0) {
      final int roll = dice1 + dice2;
      final Player playerToPlay = _game.selectPlayer();
      int position = playerToPlay.position;

      int futurePosition = playerToPlay.futurePosition(roll);
      futurePosition = _board.boardLimit(futurePosition);

      final int isLadderTile = _board.isLadderTile(futurePosition);
      final int isSnakeTile = _board.isSnakeTile(futurePosition);
      final int isFinalTile = _board.isFinalTile(futurePosition);
      final bool isDouble = _game.isDoubleDice(dice1, dice2);

      if (isLadderTile > 0) {
        position = isLadderTile;
      } else if (isSnakeTile > 0) {
        position = isSnakeTile;
      } else if (isFinalTile > 0) {
        position = isFinalTile;
        _winner = playerToPlay.id;
      } else {
        position = futurePosition;
      }

      // TODO: move tile by tile
      playerToPlay.move(position);
      _game.switchPlayerTurn(isDouble);
      notifyListeners();
      print('double: $isDouble | roll: $roll | snake: $isSnakeTile | ladder: $isLadderTile, finish: $isFinalTile');
    }
    if (_winner != 0) print('winner: $_winner');
  }
}
