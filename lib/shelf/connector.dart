import 'package:fish_redux/fish_redux.dart';
import 'state.dart';
import 'package:fish_architecture/home/state.dart';
import 'package:fish_architecture/account/state.dart';

class HomeConnector extends ConnOp<ShelfState, HomeState> {
  @override
  HomeState get(ShelfState state) {
    final HomeState homeState = HomeState();
//    reportState.total = state.toDos.length;
//    reportState.done =
//        state.toDos.where((ToDoState tds) => tds.isDone).toList().length;
    return homeState;
  }

  @override
  void set(ShelfState state, HomeState subState) {}
}

class AccountConnector extends ConnOp<ShelfState, AccountState> {
  @override
  AccountState get(ShelfState state) {
    final AccountState accountState = AccountState();
//    reportState.total = state.toDos.length;
//    reportState.done =
//        state.toDos.where((ToDoState tds) => tds.isDone).toList().length;
    return accountState;
  }

  @override
  void set(ShelfState state, AccountState subState) {}
}
