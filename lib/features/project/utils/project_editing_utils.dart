import 'package:flutter/material.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';

class ProjectEditingUtils {
  static bool nameValidator({required String name}) {
    final isValid = name.trim().isNotEmpty;
    return isValid;
  }


  static Future<void> pickUpDate({
    required BuildContext context,
    required Function(DateTime? picked) onChanged,
  }) async {
    final picked = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.utc(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: context.colors.primary,
              onPrimary: context.colors.secondary,
              surface: context.colors.secondary,
              onSurface: context.colors.textColor,
              secondaryContainer: context.colors.primary.withValues(alpha: 0.2),
            ),
            datePickerTheme: DatePickerThemeData(
              headerBackgroundColor: context.colors.primary,
              headerForegroundColor: context.colors.secondary,
              todayBorder: BorderSide(color: context.colors.primary),
            ),
          ),
          child: child!,
        );
      },
    );
    onChanged(picked);
  }
}
