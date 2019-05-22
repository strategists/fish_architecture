import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Effect<ShelfState> buildEffect() {
  return combineEffects(<Object, Effect<ShelfState>>{
    ShelfAction.fetch: _fetch,
  });
}

void _fetch(Action action, Context<ShelfState> ctx) {
  ///
  ctx.dispatch(ShelfActionCreator.fetch());
}
