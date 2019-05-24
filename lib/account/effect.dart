import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';
import 'package:fish_architecture/base/repository.dart';


Effect<AccountState> buildEffect() {
  return combineEffects(<Object, Effect<AccountState>>{
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
    AccountAction.fetch: _fetch,
  });
}

void _init(Action action, Context<AccountState> ctx) {
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
  Repository()
      .loadProfile(ctx.context)
      .doOnListen(() {})
      .doOnError((error, stacktrace) {})
      .doOnData(
          (onData) => ctx.dispatch(AccountActionCreator.bindViewAction(onData)))
      .listen(null);
}

void _dispose(Action action, Context<AccountState> ctx) {
  ctx.state.scrollController.dispose();
  ctx.state.listScrollController.dispose();
}

void _fetch(Action action, Context<AccountState> ctx) {
//  ctx.dispatch(AccountActionCreator.fetch());
}
