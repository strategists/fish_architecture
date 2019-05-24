import 'package:fish_redux/fish_redux.dart';
import 'package:fish_architecture/entity/entity.dart';

import 'action.dart';
import 'state.dart';

Reducer<AccountState> buildReducer() {
  return asReducer(<Object, Reducer<AccountState>>{
    AccountAction.bindView: _bindView,
  });
}

AccountState _bindView(AccountState state, Action action) {
  final ProfileEntity profile = action.payload;
  return state.clone()
    ..data = profile.data
    ..listScrollController = state.listScrollController
    ..scrollController = state.scrollController;
}
