import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

class HomeState implements Cloneable<HomeState> {
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
  return state;
}
