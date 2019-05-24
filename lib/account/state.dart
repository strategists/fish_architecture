import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:fish_architecture/entity/entity.dart';

class AccountState implements Cloneable<AccountState> {
  final double FOLD_HEAD = 220;
  ScrollController scrollController;
  ScrollController listScrollController;
  List<PreferenceItem> data;

  AccountState() {}

  @override
  AccountState clone() {
    return AccountState()..data = data;
  }

  @override
  String toString() {
    return 'AccountState{}';
  }
}

AccountState initState(Map<String, dynamic> args) {
  //just demo, do nothing here...
  final AccountState state = AccountState();
  state.scrollController = new ScrollController();
  state.listScrollController = new ScrollController();
  state.data = [];
  return state;
}
