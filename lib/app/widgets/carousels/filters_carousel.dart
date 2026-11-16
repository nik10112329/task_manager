import 'package:flutter/material.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';

class TMFiltersCarousel extends StatelessWidget {
  const TMFiltersCarousel({
    required this.selectIndex,
    required this.tags,
    required this.onTapTask,
    super.key,
  });

  final List<String> tags;
  final int selectIndex;
  final Function(int index) onTapTask;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 32.5),
          ...List.generate(tags.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Clickable(
                onTap: () {
                  onTapTask(index);
                },
                child: Container(
                  width: 130,
                  height: 50,
                  decoration: BoxDecoration(
                    color: selectIndex == index
                        ? context.colors.selectedBackgroundTagColor
                        : context.colors.backgroundTagColor,
                    borderRadius: BorderRadius.circular(55),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        tags[index],
                        style: context.styles.textStyle.copyWith(
                          fontWeight: index == selectIndex
                              ? FontWeight.bold
                              : null,
                          color: context.colors.textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
          const SizedBox(width: 32.5),
        ],
      ),
    );
  }
}
