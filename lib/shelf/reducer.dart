import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ShelfState> buildReducer() {
  return asReducer(<Object, Reducer<ShelfState>>{
    ShelfAction.init: _init,
//    ShelfAction.onTap: _onTap,
    ShelfAction.onChangePage: _changePage,
  });
}

ShelfState _init(ShelfState state, Action action) {
  final int index = action.payload;
  print("payload $index");
//  state.pageController.jumpToPage(action.payload);
  return state.clone()..currentPage = action.payload;
}

ShelfState _onTap(ShelfState state, Action action) {
  final int index = action.payload;
  print("payload $index");
  state.pageController.jumpToPage(action.payload);
  return state;
}

ShelfState _changePage(ShelfState state, Action action) {
  final int index = action.payload;
  print("payload $index");
//  state.pageController.jumpToPage(action.payload);
  return state.clone()..currentPage = action.payload;
}
