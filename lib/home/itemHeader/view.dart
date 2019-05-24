import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
  ItemHeaderState state,
  Dispatch dispatch,
  ViewService viewService,
) {
  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.access_alarms,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
          ),
          Text(
            "中链融",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20.0),
      child: Text(
        "链接信用，融通资金",
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      _buildTitle(),
      _buildSubTitle(),
    ],
  );
}
