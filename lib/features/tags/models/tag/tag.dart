import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/features/tags/models/tag/color_converter/color_converter.dart';

part 'tag.freezed.dart';

part 'tag.g.dart';

@freezed
abstract class TMTaskTag with _$TMTaskTag {
  const factory TMTaskTag({
    required String id,
    required String name,
    @ColorConverter() int? color,
  }) = _TMTaskTag;

  factory TMTaskTag.fromJson(Map<String, dynamic> json) =>
      _$TMTaskTagFromJson(json);
}
