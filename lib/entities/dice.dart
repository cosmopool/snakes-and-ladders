import 'dart:math';

class Dice {
  int roll() {
    return Random().nextInt(6) + 1;
  }
}
