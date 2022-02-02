import 'package:flutter/material.dart';
import 'package:snakes_and_ladders/entities/dice.dart';

class DiceProvider extends ChangeNotifier {
  final Dice _dice;
  DiceProvider(this._dice);

  int roll() {
    final roll = _dice.roll();
    return roll;
  }
}
