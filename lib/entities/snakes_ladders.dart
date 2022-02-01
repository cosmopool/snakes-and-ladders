import 'package:snakes_and_ladders/entities/player.dart';

import 'board.dart';

class SnakesLadders {
  late Player player1;
  late Player player2;
  late Board board;
  int _playerTurn = 1;

  SnakesLadders(this.board, this.player1, this.player2);

  Player _selectPlayer() {
    return (_playerTurn == 1) ? player1 : player2;
  }

  void _switchPlayerTurn(bool isDouble) {
    if (isDouble && _playerTurn == 1) {
      _playerTurn = 1;
    } else if (isDouble && _playerTurn == 2) {
      _playerTurn = 2;
    } else if (_playerTurn == 1) {
      _playerTurn = 2;
    } else if (_playerTurn == 2) {
      _playerTurn = 1;
    }
  }

  int get playerTurn => _playerTurn;

  bool isDoubleDice(int dice1, int dice2) {
    if (dice1 == dice2) {
      return true;
    } else {
      return false;
    }
  }

  void play(int dice1, int dice2) {
    final Player playerToPlay = _selectPlayer();
    int position = playerToPlay.position;
    final int roll = dice1 + dice2;
    final int futurePosition = playerToPlay.futurePosition(roll);
    final int isLadderTile = board.isLadderTile(futurePosition);
    final int isSnakeTile = board.isSnakeTile(futurePosition);
    final bool isDouble = isDoubleDice(dice1, dice2);

    if (isLadderTile > 0) {
      position = isLadderTile;
    } else if (isSnakeTile > 0) {
      position = isSnakeTile;
    } else {
      position = roll;
    }

    playerToPlay.move(position);
    _switchPlayerTurn(isDouble);
  }
}
