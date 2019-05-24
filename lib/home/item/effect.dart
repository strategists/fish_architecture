import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<ItemState> buildEffect() {
  return combineEffects(<Object, Effect<ItemState>>{
    Lifecycle.initState: _init,
    ItemAction.fetch: _fetch,
  });
}

void _init(Action action, Context<ItemState> ctx) {
  ctx.dispatch(ItemActionCreator.init());
}

void _fetch(Action action, Context<ItemState> ctx) {
  ///
  ctx.dispatch(ItemActionCreator.fetch());
}