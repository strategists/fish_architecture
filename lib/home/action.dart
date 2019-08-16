import 'package:fish_redux/fish_redux.dart';

enum HomeAction {
  onBindView,
}

class HomeActionCreator {
  static Action onBindView(dynamic data) {
    return Action(HomeAction.onBindView, payload: data);
  }
}
