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
    final Image yellowAvatar = Image.asset('assets/avatar_yellow.png');
    final Image greenAvatar = Image.asset('assets/avatar_green.png');
    final player1 = context.watch<CobrasEscadas>().player1;
    final player2 = context.watch<CobrasEscadas>().player2;
    final dice = context.read<DiceProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PlayButtonWidget(
          image: yellowAvatar,
          onTap: () => context.read<CobrasEscadas>().jogar(dice.roll(), dice.roll()),
          player: player1,
        ),
        PlayButtonWidget(
          image: greenAvatar,
          onTap: () => context.read<CobrasEscadas>().jogar(dice.roll(), dice.roll()),
          player: player2,
        ),
      ],
    );
  }
}
