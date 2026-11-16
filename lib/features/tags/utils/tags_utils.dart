import 'dart:ui';
import 'package:task_manager/features/tags/models/tag/tag.dart';
import 'package:uuid/uuid.dart';

class TagsUtils {
  static TMTaskTag createTagWithId({
    required String name,
    required Color? color,
  }) {
    const uuid = Uuid();
    return TMTaskTag(id: uuid.v4(), name: name, color: color?.toARGB32());
  }
}
