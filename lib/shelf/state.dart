import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

class ShelfState implements Cloneable<ShelfState> {
  PageController pageController;
  int currentPage;

  ShelfState() {}

  @override
  ShelfState clone() {
    return ShelfState()
      ..pageController = pageController
      ..currentPage = currentPage;
  }

  @override
  String toString() {
    return 'ShelfState{}';
  }
}

ShelfState initState(Map<String, dynamic> args) {
  //just demo, do nothing here...
  final ShelfState state = ShelfState();
  state.pageController = new PageController(initialPage: 0,);
  state.currentPage = 0;
  return state;
}
