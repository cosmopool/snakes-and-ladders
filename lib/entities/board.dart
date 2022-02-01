class Board {
  static const Map<String, List<int>> _ladder = {
    '1': [2, 38],
    '2': [7, 14],
    '3': [8, 31],
    '4': [15, 26],
    '5': [21, 42],
    '6': [28, 84],
    '7': [36, 44],
    '8': [51, 67],
    '9': [71, 91],
    '10': [78, 98],
    '11': [87, 94],
  };

  static const Map<String, List<int>> _snake = {
    '1': [16, 6],
    '2': [46, 25],
    '3': [49, 11],
    '4': [62, 19],
    '5': [64, 60],
    '6': [74, 53],
    '7': [89, 68],
    '8': [92, 88],
    '9': [95, 75],
    '10': [99, 80],
  };

  /// return positive int if player position can climb ladder
  /// return negative int if player position can not climb ladder
  int isLadderTile(int position) {
    int res = -1;

    _ladder.forEach((ladder, ladderTiles) {
      int ladderBottomTile = ladderTiles[0];
      int ladderTopTile = ladderTiles[1];

      if (position == ladderBottomTile) res = ladderTopTile;
    });

    return res;
  }

  /// return positive int if player position can slide snake
  /// return negative int if player position can not slide snake
  int isSnakeTile(int position) {
    int res = -1;

    _snake.forEach((snake, snakeTiles) {
      int snakeHead = snakeTiles[0];
      int snakeTail = snakeTiles[1];

      if (position == snakeHead) res = snakeTail;
    });

    return res;
  }
}
