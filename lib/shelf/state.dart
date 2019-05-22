import 'package:fish_redux/fish_redux.dart';

class ShelfState implements Cloneable<ShelfState> {

  ShelfState() {}

  @override
  ShelfState clone() {
    return ShelfState();
  }

  @override
  String toString() {
    return 'ShelfState{}';
  }
}

ShelfState initState(Map<String, dynamic> args) {
  //just demo, do nothing here...
  return ShelfState();
}
