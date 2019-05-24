import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';
import 'package:fish_architecture/style/style.dart';

Widget buildView(
  HomeState state,
  Dispatch dispatch,
  ViewService viewService,
) {
  return _View(state, dispatch, viewService).buildView();
}

class _View {
  HomeState state;
  Dispatch dispatch;
  ViewService viewService;

  _View(this.state, this.dispatch, this.viewService);

  Widget buildView() {
    var stack = Stack(
      children: <Widget>[
        _buildNestedScrollView(),
        Positioned(
          left: 16,
          right: 16,
          top: 0,
          bottom: 0,
          child: SafeArea(child: _buildListView()),
        )
      ],
    );
    return Container(
      color: AppColors.home_bg,
      child: stack,
    );
  }

  Widget _buildNestedScrollView() {
    return NestedScrollView(
      controller: state.scrollController,
      physics: NeverScrollableScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        debugPrint("innerBoxIsScrolled: $innerBoxIsScrolled");
        return <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: state.FOLD_HEAD,
              child: Image.asset(
                "assets/fold_head.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ];
      },
      body: Container(
        color: AppColors.home_bg,
      ),
    );
  }

  Widget _buildListView() {
    /* List<Widget> widgets = [];
    widgets.add(_buildTitle());
    widgets.add(_buildSubTitle());
    for (int i = 0; i < 50; i++) {
      widgets.add(_buildItemCard());
    }*/
    ListAdapter adapter = viewService.buildAdapter();
    return ListView.builder(
      itemBuilder: adapter.itemBuilder,
      controller: state.listScrollController,
      itemCount: adapter.itemCount,
    );
  }
}
