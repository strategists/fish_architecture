import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';

//import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _init,
//    HomeAction.fetch: _fetch,
  });
}

void _init(Action action, Context<HomeState> ctx) {
//  ctx.dispatch(HomeActionCreator.init());
  ctx.state.listScrollController.addListener(() {
    double offset = ctx.state.listScrollController.offset;
    print("offset:$offset");
    ctx.state.scrollController.jumpTo(offset);
  });

  ctx.state.scrollController.addListener(() {
    double offset = ctx.state.scrollController.offset;
    double statusBarHeight = MediaQuery.of(ctx.context).padding.top;
    if (offset == ctx.state.FOLD_HEAD) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark));
    } else if (offset == 0) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light));
    }
  });
}

void _fetch(Action action, Context<HomeState> ctx) {
  ///
//  ctx.dispatch(HomeActionCreator.fetch());
}