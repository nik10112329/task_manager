// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:task_manager/app/extensions/num.dart';
// import 'package:task_manager/app/localization/generated/l10n.dart';
// import 'package:task_manager/app/widgets/app_bar/search_field.dart';
// import 'package:task_manager/app/widgets/app_bar/app_bar.dart';
//
// @RoutePage()
// class SearchView extends StatefulWidget {
//   const SearchView({super.key});
//
//   @override
//   State<SearchView> createState() => _SearchViewState();
// }
//
// class _SearchViewState extends State<SearchView> {
//   int value = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: TMAppBar(
//         title: SearchField(controller: TextEditingController()),
//       ),
//       body: Center(child: Text('${S.current.search} ${value.formatted}')),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             value++;
//           });
//         },
//       ),
//     );
//   }
// }
