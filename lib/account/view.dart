import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:fish_architecture/style/style.dart';
import 'package:fish_architecture/entity/entity.dart';

import 'state.dart';

Widget buildView(
  AccountState state,
  Dispatch dispatch,
  ViewService viewService,
) {
  return _View(state, dispatch, viewService).buildView();
}

class _View {
  AccountState state;
  Dispatch dispatch;
  ViewService viewService;
  _View(this.state, this.dispatch, this.viewService);

  Widget buildView() {
    return Container(
      child: Stack(
        children: <Widget>[
          _buildScrollBg(),
          SafeArea(
            child: _buildList(),
          )
        ],
      ),
//      child: _buildCollapsible(),
    );
  }

  Widget _buildScrollBg() {
    return NestedScrollView(
      controller: state.scrollController,
      physics: NeverScrollableScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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

  Widget _buildList() {
    List<Widget> children = [];
    children.add(_buildTitle());
    children.add(_buildSubTitle());
    children.add(_buildHeader());
    children.addAll(_buildGroup(state.data));
    var listView = ListView(
      children: children,
      controller: state.listScrollController,
    );
    return listView;
  }

  Widget _buildTitle() {
    var text = Text(
      "Hi，欢迎来到中链融",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
    return Padding(
      padding: EdgeInsets.only(top: 28, right: 16),
      child: Align(
        alignment: Alignment.centerRight,
        child: text,
      ),
    );
  }

  Widget _buildSubTitle() {
    var text = Text(
      "专为中小企业打造的供应链资金服务平台",
      maxLines: 1,
      strutStyle: StrutStyle(
        fontSize: 24,
        fontWeight: FontWeight.normal,
      ),
      style: TextStyle(
        color: Colors.white54,
        fontSize: 12,
      ),
    );
    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: Align(
        alignment: Alignment.centerRight,
        child: text,
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(top: 18, left: 8, right: 8),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12.0),
        color: Colors.blueAccent,
        child: _buildCardChild(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
      ),
    );
  }

  Widget _buildCardChild() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.person,
          size: 68,
        ),
        _buildProfile(),
        Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.arrow_right,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Column _buildProfile() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "张三",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            )
          ],
        ),
        Text(
          "13693302061",
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  /// build group
  List<Widget> _buildGroup(List<PreferenceItem> items) {
    List<Widget> widgets = [];
    for (int i = 0; i < items.length; i++) {
      PreferenceItem item = items[i];
      widgets.add(_buildItem(item));
      if (!item.isGroupHeader) {
        if (item.isGroup) {
          widgets.add(_buildLine());
        } else {
          widgets.add(_buildGap());
        }
      }
    }
    return widgets;
  }

  Widget _buildItem(PreferenceItem item) {
    var listTile = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      onTap: () {
//        _itemClick(item);
      },
      title: Text(
        item.text,
        style: TextStyle(
          fontWeight: item.isGroupHeader ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: item.isGroupHeader ? null : Icon(Icons.chevron_right),
    );
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: item.isGroupHeader
            ? BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              )
            : null,
      ),
//      color: Colors.white,
      child: listTile,
    );
  }

  Widget _buildLine() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Divider(
          color: Colors.grey,
          height: 2,
        ),
      ),
    );
  }

  Widget _buildGap() {
    return Container(
//      color: Colors.grey,
      height: 6.0,
    );
  }
}
