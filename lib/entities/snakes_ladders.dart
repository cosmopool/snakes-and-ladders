import 'package:snakes_and_ladders/entities/player.dart';

import 'board.dart';

class SnakesLadders {
  late Player player1;
  late Player player2;
  late Board board;
  int _winner = 0;
  late int _playerTurn;

  SnakesLadders(this.board, this.player1, this.player2) {
    _playerTurn = player1.id;
  }

  int get winner => _winner;

  Player selectPlayer() {
    return (_playerTurn == player1.id) ? player1 : player2;
  }

  void switchPlayerTurn(bool isDouble) {
    final int p1 = player1.id;
    final int p2 = player2.id;

    if (isDouble && _playerTurn == p1) {
      _playerTurn = p1;
    } else if (isDouble && _playerTurn == p2) {
      _playerTurn = p2;
    } else if (_playerTurn == p1) {
      _playerTurn = p2;
    } else if (_playerTurn == p2) {
      _playerTurn = p1;
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
    if (_winner != 0) return;

    final Player playerToPlay = selectPlayer();
    int position = playerToPlay.position;
    final int roll = dice1 + dice2;

    int futurePosition = playerToPlay.futurePosition(roll);
    futurePosition = board.boardLimit(futurePosition);

    final int isLadderTile = board.isLadderTile(futurePosition);
    final int isSnakeTile = board.isSnakeTile(futurePosition);
    final bool isDouble = isDoubleDice(dice1, dice2);

    if (isLadderTile > 0) {
      position = isLadderTile;
    } else if (isSnakeTile > 0) {
      position = isSnakeTile;
    } else {
      position = futurePosition;
    }

    playerToPlay.move(position);
    if (playerToPlay.position == 100) {
      _winner = playerToPlay.id;
    } else {
      switchPlayerTurn(isDouble);
    }
  }

  void newGame() {
    player1.resetPosition();
    player2.resetPosition();
    _winner = 0;
    _playerTurn = 1;
  }
}
