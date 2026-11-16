// import 'package:freezed_annotation/freezed_annotation.dart';
//
// // enum TMTaskTag { notForTesting, backend, frontend }
//
// class TMTaskTagConverter implements JsonConverter<TMTaskTag, String> {
//   const TMTaskTagConverter();
//
//   @override
//   TMTaskTag fromJson(String value) => switch (value) {
//     'notForTesting' || 'not_for_testing' => TMTaskTag.notForTesting,
//     'backend' || 'Backend' => TMTaskTag.backend,
//     'frontend' || 'Frontend' => TMTaskTag.frontend,
//     _ => TMTaskTag.notForTesting,
//   };
//
//   @override
//   String toJson(TMTaskTag tags) => switch (tags) {
//     TMTaskTag.notForTesting => 'notForTesting',
//     TMTaskTag.backend => 'Backend',
//     TMTaskTag.frontend => 'Frontend',
//   };
// }
