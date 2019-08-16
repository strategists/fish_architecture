import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

class ItemState implements Cloneable<ItemState> {
  dynamic data;

  ItemState({this.data});

  @override
  ItemState clone() {
    return ItemState()..data = data;
  }

  @override
  String toString() {
    return 'ItemState{}';
  }
}

ItemState initState(Map<String, dynamic> args) {
  final ItemState state = ItemState();
  return state;
}
