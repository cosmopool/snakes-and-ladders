import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snakes_and_ladders/entities/player.dart';
import 'package:snakes_and_ladders/ui/providers/snakes_ladders_provider.dart';
import 'package:snakes_and_ladders/ui/widgets/message_container_widget.dart';

class DisplayAreaWidget extends StatefulWidget {
  const DisplayAreaWidget({Key? key}) : super(key: key);

  @override
  _DisplayAreaWidgetState createState() => _DisplayAreaWidgetState();
}

class _DisplayAreaWidgetState extends State<DisplayAreaWidget> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final player1 = context.watch<CobrasEscadas>().player1;
    final player2 = context.watch<CobrasEscadas>().player2;

    int playerTurn = context.watch<CobrasEscadas>().playerTurn;
    String playerString =
        (playerTurn == context.watch<CobrasEscadas>().player1.id)
            ? 'Amarelo'
            : 'Verde';
    Player player = (playerTurn == player1.id) ? player1 : player2;

    const style = TextStyle(fontSize: 30.0);

    // bool snakeTileMsg = context.watch<CobrasEscadas>().snakeTileMsg;
    // bool ladderTileMsg = context.watch<CobrasEscadas>().ladderTileMsg;
    // bool winnerMsg = context.watch<CobrasEscadas>().winnerMsg;
    // bool playerTurnMsg = context.watch<CobrasEscadas>().playerTurnMsg;
    // print(
    //     'snake: $snakeTileMsg, ladder: $ladderTileMsg, winner: $winnerMsg, playerTurn: $playerTurnMsg');

    return Container(
      height: screenHeight - screenHeight * .2 - screenWidth,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .1),
      child: Stack(
        children: [
          MessageContainerWidget(
            controller: context.watch<CobrasEscadas>().snakeTileMsg,
            message: 'Olha a Cobraaaaa!!!',
          ),
          MessageContainerWidget(
            message: 'Obaa, uma escada!',
            controller: context.watch<CobrasEscadas>().ladderTileMsg,
          ),
          MessageContainerWidget(
            message: 'Jogador $playerString \n Venceu!',
            controller: context.watch<CobrasEscadas>().winnerMsg,
          ),
          MessageContainerWidget(
            message: 'O jogo acabou!',
            controller: context.watch<CobrasEscadas>().gameIsOverMsg,
          ),
          // MessageContainerWidget(
          //   // TODO: dice roll
          //   message: 'Voce rolou um X',
          //   controller: context.watch<CobrasEscadas>().showDiceMsg,
          // ),
          // MessageContainerWidget(
          //   message: '$playerString está \n na casa ${player.position}',
          //   controller: context.watch<CobrasEscadas>().playerTurnMsg,
          // ),
          // MessageContainerWidget(
          //   message: 'Eh a vez do \n $playerString',
          //   controller: context.watch<CobrasEscadas>().playerTurnMsg,
          // ),
        ],
      ),
    );
  }
}
