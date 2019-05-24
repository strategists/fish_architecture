import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'itemHeader/state.dart';

class HomeState implements Cloneable<HomeState> {
  final double FOLD_HEAD = 150;
  ScrollController scrollController;
  ScrollController listScrollController;

  HomeState() {}

  @override
  HomeState clone() {
    return HomeState();
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
