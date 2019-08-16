import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<ItemState> buildEffect() {
  return combineEffects(<Object, Effect<ItemState>>{
    ItemAction.onClick: _click,
  });
}

void _click(Action action, Context<ItemState> ctx) {

}