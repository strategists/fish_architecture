import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

class ItemComponent extends Component<ItemState> {
  ItemComponent()
      : super(
          view: buildView,
          effect: buildEffect(),
        );
}
