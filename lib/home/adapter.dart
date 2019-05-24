import 'package:fish_redux/fish_redux.dart';
import 'package:fish_architecture/home/state.dart';
import 'item/component.dart';
import 'item/state.dart';
import 'itemHeader/component.dart';
import 'itemHeader/state.dart';

class HomeAdapter extends DynamicFlowAdapter<HomeState> {
  HomeAdapter()
      : super(
          pool: <String, Component<Object>>{
//            'header': ItemHeaderComponent(),
            'itemCard': ItemComponent(),
          },
          connector: _ListConnector(),
        );
}

class _ListConnector extends ConnOp<HomeState, List<ItemBean>> {
  @override
  List<ItemBean> get(HomeState state) {
    List<ItemBean> list = [];
    List<ItemState> states = [];
    for (int i = 0; i < 10; i++) {
      states.add(ItemState());
    }
    return states.map((ItemState data) => ItemBean('itemCard', data)).toList();
  }

  @override
  void set(HomeState state, List<ItemBean> item) {}
}
