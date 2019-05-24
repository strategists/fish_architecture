import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

class ItemHeaderComponent extends Component<ItemHeaderState> {
  ItemHeaderComponent()
      : super(
          view: buildView,
        );
}
