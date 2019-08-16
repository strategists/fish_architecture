import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';
import 'package:fish_architecture/entity/entity.dart';
import 'item/state.dart';
import 'itemHeader/state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(<Object, Reducer<HomeState>>{
    HomeAction.onBindView: _bindView,
  });
}

HomeState _bindView(HomeState state, Action action) {
  final HomeItemEntity homeItem = action.payload;
  List<ItemState> itemStates = [];
  homeItem.data.map((f) => itemStates.add(new ItemState()..data = f)).toList();
  final HomeState newState = state.clone();
  newState.itemStates = itemStates;
  newState.headerState = new ItemHeaderState();
  return newState;
}
