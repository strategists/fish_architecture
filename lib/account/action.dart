import 'package:fish_redux/fish_redux.dart';
import 'package:fish_architecture/entity/entity.dart';

enum AccountAction {
  init,
  fetch,
  bindView,
}

class AccountActionCreator {
  static Action initState() {
    return const Action(AccountAction.init);
  }

  static Action fetch() {
    return const Action(AccountAction.fetch);
  }

  static Action bindViewAction(dynamic profile) {
    return Action(AccountAction.bindView, payload: profile);
  }
}
