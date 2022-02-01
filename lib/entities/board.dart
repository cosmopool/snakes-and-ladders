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

  /// return positive int with ladder final tile if position can climb ladder
  /// return negative int if position can not climb ladder
  int isLadderTile(int position) {
    int res = -1;

    _ladder.forEach((ladder, ladderTiles) {
      int ladderBottomTile = ladderTiles[0];
      int ladderTopTile = ladderTiles[1];

      if (position == ladderBottomTile) res = ladderTopTile;
    });

    return res;
  }
}
