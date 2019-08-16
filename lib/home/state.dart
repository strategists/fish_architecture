import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'itemHeader/state.dart';
import 'item/state.dart';

class HomeState implements Cloneable<HomeState> {
  final double FOLD_HEAD = 150;
  ScrollController scrollController;
  ScrollController listScrollController;
  List<ItemState> itemStates;
  ItemHeaderState headerState;

  HomeState() {}

  @override
  HomeState clone() {
    return HomeState()
      ..listScrollController = listScrollController
      ..scrollController = scrollController
      ..itemStates = itemStates
      ..headerState = headerState;
  }

  @override
  String toString() {
    return 'HomeState{}';
  }
}

HomeState initState(Map<String, dynamic> args) {
  //just demo, do nothing here...
  final HomeState state = HomeState();
  state.scrollController = new ScrollController();
  state.listScrollController = new ScrollController();
  state.itemStates = [];
  return state;
}

class HeaderConnector extends ConnOp<HomeState, ItemHeaderState> {
  @override
  ItemHeaderState get(HomeState state) {
    final ItemHeaderState state = ItemHeaderState();
    return state;
  }

  @override
  void set(HomeState state, ItemHeaderState subState) {}
}
