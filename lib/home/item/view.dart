import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:fish_architecture/style/style.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
  ItemState state,
  Dispatch dispatch,
  ViewService viewService,
) {
  return _View(state, dispatch, viewService).buildItemCard();
}

class _View {
  ItemState state;
  Dispatch dispatch;
  ViewService viewService;

  _View(this.state, this.dispatch, this.viewService);

  Widget buildItemCard() {
    var column = Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 100),
          child: _buildSubRow(),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 315, maxWidth: 315),
          child: _buildSubCard(),
        ),
      ],
    );

    var card = Card(
      child: Padding(
        padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 10),
        child: column,
      ),
    );
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 210,
      ),
      child: card,
    );
  }

  Widget _buildSubRow() {
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "应收通",
              style: TextStyle(color: AppColors.home_item_title, fontSize: 18),
            ),
            Text(
              "最高可借额度(元)",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Text("500000", style: TextStyle(color: Colors.grey, fontSize: 24)),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: RaisedButton(
            textTheme: ButtonTextTheme.primary,
            color: AppColors.home_item_button,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18))),
            onPressed: () {
              /*Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ReceivableLaunchPage();
              }));*/
            },
            child: Text("我要融资"),
          ),
        ),
      ],
    );
  }

  Widget _buildSubCard() {
    List<Widget> widgets = [];
    var listTile = Chip(
      backgroundColor: Colors.white,
      label: Text(
        "线上申请极速放款",
        style: TextStyle(fontSize: 10),
      ),
      avatar: Icon(Icons.ac_unit),
    );
    for (int i = 0; i < 4; i++) {
      widgets.add(listTile);
    }
    return Card(
      color: AppColors.home_item_sub_card,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        direction: Axis.horizontal,
        spacing: 18.0,
        // gap between adjacent chips
        runSpacing: 10.0,
        // gap between lines
        children: widgets,
      ),
    );
  }
}
