import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';
import 'effect.dart';
import 'adapter.dart';
import 'itemHeader/component.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
          initState: initState,
          view: buildView,
          effect:buildEffect(),
          dependencies: Dependencies<HomeState>(
            adapter: HomeAdapter(),
//            slots: <String, Dependent<HomeState>>{
//              'header': HeaderConnector() + ItemHeaderComponent()
//            },
          ),
          middleware: <Middleware<HomeState>>[
            logMiddleware(tag: 'HomePage'),
          ],
        );
}
