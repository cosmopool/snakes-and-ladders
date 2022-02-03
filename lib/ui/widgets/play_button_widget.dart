import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:snakes_and_ladders/entities/player.dart';
import 'package:snakes_and_ladders/ui/providers/snakes_ladders_provider.dart';

class PlayButtonWidget extends StatefulWidget {
  final Image image;
  final dynamic onTap;
  final Player player;
  const PlayButtonWidget(
      {Key? key,
      required this.image,
      required this.onTap,
      required this.player})
      : super(key: key);

  @override
  _PlayButtonWidgetState createState() => _PlayButtonWidgetState();
}

class _PlayButtonWidgetState extends State<PlayButtonWidget> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonSize = .15;
    int playerTurn = context.watch<CobrasEscadas>().playerTurn;
    final playerId = widget.player.id;
    final player1 = context.watch<CobrasEscadas>().player1;

    dynamic notYourTurn
        // () => context.watch<CobrasEscadas>().sendMessage(Message.playerTurn);
        () {
      String _turn = (playerTurn == player1.id) ? 'Amarelo' : 'Verde';
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Nao eh a sua vez!"),
          content: Text("Eh a vez do $_turn, aguarde sua vez."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("okey"),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: screenHeight * buttonSize,
          child: GestureDetector(
            child: SimpleShadow(
              child: widget.image,
              opacity: 0.6, // Default: 0.5
              color: Colors.black, // Default: Black
              offset: const Offset(1, 7), // Default: Offset(2, 2)
              sigma: 7, // Default: 2
            ),
            onTap: (playerTurn == playerId)
                ? () => widget.onTap()
                : () => notYourTurn(),
          ),
        ),
        Text('Casa: ${widget.player.position}',
            style: TextStyle(
              fontSize: screenWidth * .05,
              decoration: TextDecoration.none,
              // background: Paint()
              //   ..style = PaintingStyle.stroke
              //   ..strokeWidth = 2
              //   ..color = Colors.red,
            )),
      ],
    );
  }
}
