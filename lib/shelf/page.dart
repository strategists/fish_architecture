import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ShelfPage extends Page<ShelfState, Map<String, dynamic>> {
  ShelfPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ShelfState>(),
          middleware: <Middleware<ShelfState>>[
            logMiddleware(tag: 'ShelfPage'),
          ],
        );
}
