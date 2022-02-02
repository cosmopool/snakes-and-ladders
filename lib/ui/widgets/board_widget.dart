import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snakes_and_ladders/entities/player.dart';
import 'package:snakes_and_ladders/entities/tile.dart';

import 'package:snakes_and_ladders/ui/providers/board_provider.dart';
import 'package:snakes_and_ladders/ui/providers/snakes_ladders_provider.dart';
import 'package:snakes_and_ladders/ui/widgets/player_widget.dart';

class BoardWidget extends StatefulWidget {
  const BoardWidget({Key? key}) : super(key: key);

  @override
  _BoardWidgetState createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  @override
  void initState() {
    super.initState();
    context.read<BoardProvider>().calculateBoardTilesCoodinations();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.width;
    double _width = MediaQuery.of(context).size.width;
    double _size = _width < _height ? _width : _height;
    double tileSize = _size / 10;
    int animationDuration = 400;

    Player player1 = context.watch<CobrasEscadas>().player1;
    Player player2 = context.watch<CobrasEscadas>().player2;
    List<Tile> tiles = context.watch<BoardProvider>().boardTiles;

    Tile player1Position = context.watch<BoardProvider>().player1Position;
    Tile player2Position = context.watch<BoardProvider>().player2Position;

    return Container(
      height: _size,
      width: _size,
      color: Colors.black,
      child: Stack(
        children: [
          Image.asset('assets/board.png'),
          AnimatedPositioned(
            duration: Duration(milliseconds: animationDuration),
            child: PlayerWidget(
              image: Image.asset('assets/avatar_yellow.png'),
              position: player1Position,
            ),
            bottom: tiles[player1.position].y * tileSize,
            left: tiles[player1.position].x * tileSize,
            curve: Curves.fastOutSlowIn,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: animationDuration),
            child: PlayerWidget(
              image: Image.asset('assets/avatar_green.png'),
              position: player2Position,
            ),
            bottom: tiles[player2.position].y * tileSize,
            left: tiles[player2.position].x * tileSize,
            curve: Curves.fastOutSlowIn,
          ),
        ],
      ),
    );
  }
}
