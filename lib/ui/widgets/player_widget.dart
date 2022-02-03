import 'package:flutter/material.dart';

class PlayerWidget extends StatelessWidget {
  final Image image;
  const PlayerWidget({Key? key, required this.image}) : super(key: key);

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
