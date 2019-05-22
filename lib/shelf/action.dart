import 'package:fish_redux/fish_redux.dart';

enum ShelfAction {
  fetch,
}

class ShelfActionCreator {
  static Action fetch() {
    return const Action(ShelfAction.fetch);
  }
}
