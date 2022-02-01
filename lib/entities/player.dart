class Player {
  late int _id;
  late int _position;
  
  Player(int id) {
    _id = id;
    _position = 0;
  }

  Player.onPosition(int pos, int id){
    _id = id;
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
