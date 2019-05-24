import 'package:fish_redux/fish_redux.dart';
import 'package:fish_architecture/home/page.dart';
import 'package:fish_architecture/account/page.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'connector.dart';

class ShelfPage extends Page<ShelfState, Map<String, dynamic>> {
  ShelfPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ShelfState>(
            slots: <String, Dependent<ShelfState>>{
              'home': HomeConnector() + HomePage(),
              'account': AccountConnector() + AccountPage(),
            },
          ),
          middleware: <Middleware<ShelfState>>[
            logMiddleware(tag: 'ShelfPage'),
          ],
        );
}
