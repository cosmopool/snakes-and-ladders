import 'dart:math';

class Player {
  final int _maxNumId = 1000000000;
  late int _id;
  late int _position;
  
  Player() {
    _id = Random().nextInt(_maxNumId);
    _position = 0;
  }

  Player.onPosition(int pos){
    _id = Random().nextInt(_maxNumId);
    _position = pos;
  }

  int get position => _position;
  int get id => _id;
  
  void move(int position) {
    _position = position;
  }
  
  int futurePosition(int roll) {
    return _position += roll;
  }

  void resetPosition() {
    _position = 0;
  }
}
