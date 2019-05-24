import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

class ItemHeaderState implements Cloneable<ItemHeaderState> {

  ItemHeaderState() {}

  @override
  ItemHeaderState clone() {
    return ItemHeaderState();
  }

  @override
  String toString() {
    return 'ItemHeaderState{}';
  }
}

ItemHeaderState initState(Map<String, dynamic> args) {
  //just demo, do nothing here...
  final ItemHeaderState state = ItemHeaderState();
  return state;
}



