import 'package:fish_redux/fish_redux.dart';

enum ItemAction {
  init,
  fetch,
}

class ItemActionCreator {
  static Action init() {
    return const Action(ItemAction.init);
  }

  static Action fetch() {
    return const Action(ItemAction.fetch);
  }
}