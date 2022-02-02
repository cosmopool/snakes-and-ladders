import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/entities/tile.dart';

class PlayerWidget extends StatelessWidget {
  final Image image;
  Tile position;
  PlayerWidget({Key? key, required this.image, required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double boardSide = MediaQuery.of(context).size.width;

    return SizedBox(
      height: boardSide / 9.5,
      width: boardSide / 10.3,
      child: image,
    );
  }
}
