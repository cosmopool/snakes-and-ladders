import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/entities/board.dart';
import 'package:snakes_and_ladders/entities/player.dart';
import 'package:snakes_and_ladders/entities/snakes_ladders.dart';

enum Message {
  snake,
  ladder,
  playerTurn,
  winner,
  dice,
  gameOver,
  playerTile
}

class CobrasEscadas extends ChangeNotifier {
  final SnakesLadders _game;
  final Board _board;
  late final Player player1;
  late final Player player2;
  int _winner = 0;
  bool snakeTileMsg = false;
  bool ladderTileMsg = false;
  bool playerTurnMsg = false;
  bool winnerMsg = false;
  bool showDiceMsg = false;
  bool gameIsOverMsg = false;
  bool playerTileMsg = false;
  int diceRoll = 0;

  CobrasEscadas(this._game, this._board) {
    player1 = _game.player1;
    player2 = _game.player2;
  }

  int get playerTurn => _game.playerTurn;
  int get winner => _winner;

  void newGame() {
    _game.newGame();
  }

  Future moveTileByTile(int finalPosition, Player player) async {
    const duration = Duration(milliseconds: 400);
    int startPosition = player.position;

    for (int i = startPosition + 1; i < finalPosition; i++) {
      await Future.delayed(duration);
      // player.move(i);
      if (i >= 100) {
        player.increasePosition();
      } else {
        player.decreasePosition();
      }
      notifyListeners();
      await Future.delayed(duration);
    }

    // while (player.position < finalPosition) {
    //   await Future.delayed(duration, () {
    //     player.position++;
    //     notifyListeners();
    //   });
    // }
  }

  void clearMessages() {
    snakeTileMsg = false;
    ladderTileMsg = false;
    playerTurnMsg = false;
    winnerMsg = false;
    showDiceMsg = false;
    gameIsOverMsg = false;
  }

  void sendMessage(Message msg) {
    clearMessages();
    switch (msg) {
      case Message.snake:
        snakeTileMsg = true;
        break;
      case Message.ladder:
        ladderTileMsg = true;
        break;
      case Message.playerTurn:
        playerTurnMsg = true;
        break;
      case Message.gameOver:
        gameIsOverMsg = true;
        break;
      case Message.dice:
        showDiceMsg = true;
        break;
      case Message.winner:
        winnerMsg = true;
        break;
      case Message.playerTile:
        playerTileMsg = true;
        break;
    }

    notifyListeners();
    print('snake: $snakeTileMsg, ladder: $ladderTileMsg');
  }

  void jogar(int dice1, int dice2) async {
    const durationSnakeLadder = Duration(milliseconds: 800);
    const durationWalk = Duration(milliseconds: 400);
    const durationMessage = Duration(seconds: 2);

    if (_winner == 0) {
      final int roll = dice1 + dice2;
      diceRoll = roll;
      sendMessage(Message.playerTile);
      // await Future.delayed(durationMessage);
      final Player playerToPlay = _game.selectPlayer();

      int futurePosition = playerToPlay.futurePosition(roll);
      futurePosition = _board.boardLimit(futurePosition);

      playerToPlay.move(futurePosition);
      notifyListeners();

      final int isLadderTile = _board.isLadderTile(futurePosition);
      final int isSnakeTile = _board.isSnakeTile(futurePosition);
      final int isFinalTile = _board.isFinalTile(futurePosition);
      final bool isDouble = _game.isDoubleDice(dice1, dice2);

      if (isLadderTile > 0) {
        sendMessage(Message.ladder);
        await Future.delayed(durationSnakeLadder);
        playerToPlay.move(isLadderTile);
      } else if (isSnakeTile > 0) {
        sendMessage(Message.snake);
        await Future.delayed(durationSnakeLadder);
        playerToPlay.move(isSnakeTile);
      }
      // notifyListeners();

      if (isFinalTile > 0) {
        _winner = playerToPlay.id;
        sendMessage(Message.winner);
      }

      // TODO: move tile by tile
      _game.switchPlayerTurn(isDouble);
      notifyListeners();
    } else {
      sendMessage(Message.winner);
      notifyListeners();
    }
  }
}
