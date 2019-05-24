import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

class ItemState implements Cloneable<ItemState> {
  dynamic data;

  ItemState() {}

  @override
  ItemState clone() {
    return ItemState();
  }

  @override
  String toString() {
    return 'ItemState{}';
  }
}

ItemState initState(Map<String, dynamic> args) {
  //just demo, do nothing here...
  final ItemState state = ItemState();
  return state;
}
