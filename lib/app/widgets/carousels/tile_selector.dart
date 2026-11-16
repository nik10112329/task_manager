import 'package:flutter/material.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';

class TMTileSelector extends StatelessWidget {
  const TMTileSelector({
    required this.onChanged,
    required this.values,
    required this.selectedValues,
    this.icons,
    this.backgroundColors,
    this.iconColors,
    this.isMultiple = false,
    super.key,
  });

  final Function(List<String> selected) onChanged;
  final List<String> values;
  final List<String> selectedValues;
  final List<IconData>? icons;
  final List<Color>? backgroundColors;
  final List<Color>? iconColors;
  final bool isMultiple;

  @override
  Widget build(BuildContext context) {
    final selectedSet = Set<String>.from(selectedValues);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: [
          const SizedBox(width: 40),
          ...values.asMap().entries.map((entry) {
            final index = entry.key;
            final value = entry.value;
            final isSelected = selectedSet.contains(value);

            final icon = (icons != null && icons!.length > index)
                ? icons![index]
                : null;

            final tileBackground =
                (backgroundColors != null && backgroundColors!.length > index)
                ? backgroundColors![index]
                : context.colors.white;

            final finalBackground = isSelected
                ? tileBackground
                : context.colors.secondary;

            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Clickable(
                onTap: () => _handleTap(value, isSelected, selectedSet),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    boxShadow: [context.colors.standardShadow],
                    borderRadius: BorderRadius.circular(14),
                    color: finalBackground,
                    border: isSelected
                        ? Border.all(width: 2, color: context.colors.primary)
                        : null,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Icon(
                              icon,
                              size: 26,
                              color: isSelected
                                  ? context.colors.primary
                                  : context.colors.iconColor,
                            ),
                          ),
                        Text(
                          value,
                          textAlign: TextAlign.center,
                          style: context.styles.textStyle.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? context.colors.primary
                                : context.colors.iconColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  void _handleTap(
    String value,
    bool isCurrentlySelected,
    Set<String> selectedSet,
  ) {
    List<String> newSelection;

    if (isMultiple) {
      if (isCurrentlySelected) {
        newSelection = selectedSet.where((v) => v != value).toList();
      } else {
        newSelection = [...selectedSet, value];
      }
    } else {
      newSelection = isCurrentlySelected ? [] : [value];
    }

    onChanged(newSelection);
  }
}
