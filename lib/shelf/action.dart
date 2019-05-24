import 'package:fish_redux/fish_redux.dart';

enum ShelfAction {
  init,
  onTap,
  onChangePage,
}

class ShelfActionCreator {
  static Action initAction(int i) {
    return Action(ShelfAction.init, payload: i);
  }

  static Action onTapAction(int i) {
//    print("action$i");
    return Action(ShelfAction.onTap, payload: i);
  }

  static Action onChangePage(int i) {
    return Action(ShelfAction.onChangePage, payload: i);
  }
}
