import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snakes_and_ladders/ui/providers/board_provider.dart';
import 'package:snakes_and_ladders/ui/providers/dice_provider.dart';
import 'package:snakes_and_ladders/ui/providers/snakes_ladders_provider.dart';
import 'package:snakes_and_ladders/ui/screen/main_screen.dart';

import 'entities/board.dart';
import 'entities/dice.dart';
import 'entities/player.dart';
import 'entities/snakes_ladders.dart';

void main() {
  final board = Board();
  final player1 = Player();
  final player2 = Player();
  final dice = Dice();
  final game = SnakesLadders(board, player1, player2);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => BoardProvider(board, player1, player2)),
      ChangeNotifierProvider(create: (_) => CobrasEscadas(game, board)),
      ChangeNotifierProvider(create: (_) => DiceProvider(dice)),
    ],
    child: MaterialApp(
      title: 'Cobras e Escadas',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: const MainPage(),
    ),
  ));
}

// class App extends StatelessWidget {
//   const App({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => BoardProvider(board)),
//       ],
//       child: const MaterialApp(
//         title: 'Cobras e Escadas',
//         home: MainPage(),
//       ),
//     );
//   }
// }
