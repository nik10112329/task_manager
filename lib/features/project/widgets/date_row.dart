import 'package:flutter/material.dart';
import 'package:task_manager/app/extensions/date_time.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';

class TMDateRow extends StatelessWidget {
  const TMDateRow({
    required this.startDate,
    required this.endDate,
    required this.onStartTap,
    required this.onEndTap,
    super.key,
  });

  final DateTime? startDate;
  final DateTime? endDate;
  final VoidCallback onStartTap;
  final VoidCallback onEndTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Clickable(
          onTap: onStartTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Начало:', style: TextStyle(color: context.colors.white)),
              Text(
                startDate?.toRuDate ?? 'Н/Д',
                style: TextStyle(color: context.colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Clickable(
          onTap: onEndTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Конец:', style: TextStyle(color: context.colors.white)),
              Text(
                endDate?.toRuDate ?? 'Н/Д',
                style: TextStyle(color: context.colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
