import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snakes_and_ladders/entities/player.dart';
import 'package:snakes_and_ladders/ui/providers/snakes_ladders_provider.dart';

class PlayButtonWidget extends StatefulWidget {
  final Image image;
  final dynamic onTap;
  final Player player;
  const PlayButtonWidget({Key? key, required this.image, required this.onTap, required this.player}) : super(key: key);

  @override
  _PlayButtonWidgetState createState() => _PlayButtonWidgetState();
}

class _PlayButtonWidgetState extends State<PlayButtonWidget> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double buttonSize = .15;
    int playerTurn = context.watch<CobrasEscadas>().playerTurn;
    final playerId = widget.player.id;

    // TODO: call: not your turn msg
    final dynamic notYourTurn = () => print('yourID: $playerId, turn: $playerTurn, not your turn');

    return SizedBox(
      height: screenHeight * buttonSize,
      child: GestureDetector(
        child: widget.image,
        onTap: (playerTurn == playerId) ? () => widget.onTap() : () => notYourTurn(),
      ),
    );
  }
}
