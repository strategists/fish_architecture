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
            'header': ItemHeaderComponent(),
            'itemCard': ItemComponent(),
          },
          connector: _ListConnector(),
        );
}

class _ListConnector extends ConnOp<HomeState, List<ItemBean>> {
  @override
  List<ItemBean> get(HomeState state) {
    List<ItemBean> list = [];
    if (state.itemStates?.isNotEmpty == true) {
      list.add(ItemBean("header", state.headerState));
      List<ItemState> states = state.itemStates;

      List<ItemBean> itemBean =
          states.map((ItemState data) => ItemBean('itemCard', data)).toList();
      list.addAll(itemBean);
      return list;
    } else {
      return list;
    }
  }

  @override
  void set(HomeState state, List<ItemBean> item) {
    if (item?.isNotEmpty == true) {
      state.itemStates = List<ItemState>.from(
          item.map<ItemState>((ItemBean bean) => bean.data).toList());
    } else {
      state.itemStates = <ItemState>[];
    }
  }
}
