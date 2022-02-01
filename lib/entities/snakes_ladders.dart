import 'package:snakes_and_ladders/entities/player.dart';

import 'board.dart';

class SnakesLadders {
  late Player player1;
  late Player player2;
  late Board board;
  int _turn = 1;

  SnakesLadders(this.board, this.player1, this.player2);

  Player _selectPlayer() {
    return (_turn == 1) ? player1 : player2;
  }

  void play(int dice1, int dice2) {
    final Player playerToPlay = _selectPlayer();
    int position = playerToPlay.position;
    final int roll = dice1 + dice2;
    final int futurePosition = playerToPlay.futurePosition(roll);
    final int isLadderTile = board.isLadderTile(futurePosition);
    final int isSnakeTile = board.isSnakeTile(futurePosition);

    if (isLadderTile > 0) {
      position = isLadderTile;
    } else if (isSnakeTile > 0) {
      position = isSnakeTile;
    } else {
      position = roll;
    }

    playerToPlay.move(position);
  }
}
