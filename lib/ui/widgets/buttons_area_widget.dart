import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snakes_and_ladders/ui/providers/dice_provider.dart';
import 'package:snakes_and_ladders/ui/providers/snakes_ladders_provider.dart';
import 'package:snakes_and_ladders/ui/widgets/play_button_widget.dart';

class ButtonsAreaWidget extends StatefulWidget {
  const ButtonsAreaWidget({Key? key}) : super(key: key);

  @override
  _ButtonsAreaWidgetState createState() => _ButtonsAreaWidgetState();
}

class _ButtonsAreaWidgetState extends State<ButtonsAreaWidget> {
  @override
  Widget build(BuildContext context) {
    final Image yellowAvatar = Image.asset('assets/avatar_yellow_play.png');
    final Image greenAvatar = Image.asset('assets/avatar_green_play.png');
    final Image yellowAvatarTurn = Image.asset('assets/avatar_yellow_turn.png');
    final Image greenAvatarTurn = Image.asset('assets/avatar_green_turn.png');

    final player1 = context.watch<CobrasEscadas>().player1;
    final player2 = context.watch<CobrasEscadas>().player2;
    int playerTurn = context.watch<CobrasEscadas>().playerTurn;
    int winner = context.watch<CobrasEscadas>().winner;
    Image currentYellowImage =
        (playerTurn == player1.id) ? yellowAvatarTurn : yellowAvatar;
    Image currentGreenImage =
        (playerTurn == player2.id) ? greenAvatarTurn : greenAvatar;
    final dice = context.read<DiceProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // TODO: animate button
        PlayButtonWidget(
          image: currentYellowImage,
          onTap: () =>
              context.read<CobrasEscadas>().jogar(dice.roll(), dice.roll()),
          player: player1,
        ),
        PlayButtonWidget(
          image: currentGreenImage,
          onTap: () =>
              context.read<CobrasEscadas>().jogar(dice.roll(), dice.roll()),
          player: player2,
        ),
      ],
    );
  }
}
