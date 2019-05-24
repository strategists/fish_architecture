import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Effect<ShelfState> buildEffect() {
  return combineEffects(<Object, Effect<ShelfState>>{
    Lifecycle.initState: _init,
    ShelfAction.onTap: _onTap,
  });
}

void _init(Action action, Context<ShelfState> ctx) {
  ctx.state.pageController.addListener(() {});
  ctx.dispatch(ShelfActionCreator.initAction(0));
}

void _onTap(Action action, Context<ShelfState> ctx) {
  final int index = action.payload;
  print("payload $index");
  ctx.state.pageController.jumpToPage(action.payload);
}
