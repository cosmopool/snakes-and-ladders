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

    // Player player1 = context.watch<CobrasEscadas>().player1;
    // Player player2 = context.watch<CobrasEscadas>().player2;
    int player1pos = context.watch<CobrasEscadas>().player1.position;
    int player2pos = context.watch<CobrasEscadas>().player2.position;
    List<Tile> tiles = context.watch<BoardProvider>().boardTiles;

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
            ),
            bottom: tiles[player1pos].y * tileSize,
            left: tiles[player1pos].x * tileSize,
            curve: Curves.fastOutSlowIn,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: animationDuration),
            child: PlayerWidget(
              image: Image.asset('assets/avatar_green.png'),
            ),
            bottom: tiles[player2pos].y * tileSize,
            left: tiles[player2pos].x * tileSize,
            curve: Curves.fastOutSlowIn,
          ),
        ],
      ),
    );
  }
}
