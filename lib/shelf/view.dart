import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:fish_architecture/home/page.dart';
import 'package:fish_architecture/account/page.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
  ShelfState state,
  Dispatch dispatch,
  ViewService viewService,
) {
  BottomNavigationBar _buildBottomNavigationBar() {
    var barItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          activeIcon: Icon(Icons.home),
          icon: Icon(Icons.my_location),
          title: Text("首页")),
      BottomNavigationBarItem(
          activeIcon: Icon(Icons.adjust),
          icon: Icon(Icons.account_circle),
          title: Text("账户")),
    ];
    return BottomNavigationBar(
      onTap: (i) => dispatch(ShelfActionCreator.onTapAction(i)),
      currentIndex: state.currentPage,
      items: barItems,
    );
  }

  Widget _buildBody() {
    return WillPopScope(
      child: PageView(
        children: <Widget>[
//          viewService.buildComponent('home'),
//          viewService.buildComponent('account'),
          HomePage().buildPage(null),
          AccountPage().buildPage(null),
        ],
        controller: state.pageController,
        onPageChanged: (index) => dispatch(ShelfActionCreator.onChangePage(index)),
        physics: NeverScrollableScrollPhysics(),
      ),
      onWillPop: () {
        //todo
        return Future.value(true);
      },
    );
  }

  return Scaffold(
    body: _buildBody(),
    bottomNavigationBar: _buildBottomNavigationBar(),
  );
}
