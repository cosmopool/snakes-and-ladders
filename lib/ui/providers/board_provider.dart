import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/entities/board.dart';
import 'package:snakes_and_ladders/entities/player.dart';
import 'package:snakes_and_ladders/entities/tile.dart';

class BoardProvider extends ChangeNotifier {
  Tile _player1WidgetPostition = Tile(0, -1, -1);
  Tile _player2WidgetPostition = Tile(0, -1, -1);
  final Player player1;
  final Player player2;
  List<Tile> _boardTiles = [];
  final Board _board;

  BoardProvider(this._board, this.player1, this.player2);

  Tile get player1Position => _player1WidgetPostition;
  Tile get player2Position => _player2WidgetPostition;
  List<Tile> get boardTiles => _boardTiles;

  void calculateBoardTilesCoodinations() {
    if (_boardTiles == []) return;

    const boardWidth = 10;
    const boardHeight = 10;

    var acc = 1;
    _boardTiles.clear();

    // start with position zero
    _boardTiles.add(Tile(0, -1, -1));
    for (int yCoord = 1; yCoord <= boardWidth; yCoord++) {
      for (int xCoord = 0; xCoord < boardHeight; xCoord++) {
        var x = (yCoord % 2 != 0) ? xCoord : boardHeight - xCoord - 1;
        var y = yCoord - 1;
        _boardTiles.add(Tile(acc, x, y));
        acc++;
      }
    }
  }

  void increasePlayer1Tile() {
    var pos = _player1WidgetPostition.number;
    if (pos < 100) {
      _player1WidgetPostition = _boardTiles[pos];
    }
    notifyListeners();
  }

  void decreasePlayer1Tile() {
    var pos = _player1WidgetPostition.number;
    if (pos - 1 > 0) {
      _player1WidgetPostition = _boardTiles[pos - 2];
    }
    notifyListeners();
  }
}
