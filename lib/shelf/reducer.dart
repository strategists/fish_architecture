import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ShelfState> buildReducer() {
  return asReducer(<Object, Reducer<ShelfState>>{
    ShelfAction.fetch: _action,
  });
}

ShelfState _action(ShelfState state, Action action) {
  final ShelfState toDo = action.payload;
  return state;
}