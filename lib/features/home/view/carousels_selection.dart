import 'package:flutter/material.dart';
import 'package:task_manager/app/widgets/carousels/cards_carousel.dart';
import 'package:task_manager/features/home/view/models/home_card_data.dart';
import 'package:task_manager/features/home/view/models/home_filter.dart';

class CarouselsSelection extends StatelessWidget {
  const CarouselsSelection({
    required this.filter,
    required this.data,
    required this.onTapData,
    required this.onLongPressData,
    required this.onChangeItem,
    this.isAddNewElement = false,
    this.onTapNewElement,
    super.key,
  });

  final HomeFilter filter;
  final List<TMHomeCardData> data;
  final VoidCallback onTapData;
  final VoidCallback onLongPressData;
  final Function(int index) onChangeItem;
  final bool isAddNewElement;
  final VoidCallback? onTapNewElement;

  @override
  Widget build(BuildContext context) => switch (filter) {
    ProjectsFilter() => TMCardsCarousel(
      items: data,
      onTapCard: onTapData,
      onChangeCard: onChangeItem,
      isAddNewElement: isAddNewElement,
      onTapNewElement: onTapNewElement,
      onLongPressCard: onLongPressData,
    ),
    MyTasksFilter() => const SizedBox.shrink(),
    TaskStatusFilter() => const SizedBox.shrink(),
  };
}
