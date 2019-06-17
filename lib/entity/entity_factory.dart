import 'package:fish_architecture/entity/profile_entity.dart';
import 'package:fish_architecture/entity/study_info_entity.dart';
import 'entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "ProfileEntity") {
      return ProfileEntity.fromJson(json) as T;
    } else if (T.toString() == "StudyInfoEntity") {
      return StudyInfoEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}
