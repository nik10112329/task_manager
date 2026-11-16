import 'package:flutter/material.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';

class TMTextField extends StatelessWidget {
  const TMTextField({
    required this.controller,
    required this.label,
    this.obscureText = false,
    super.key,
  });

  final TextEditingController controller;
  final String label;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextField(
        obscureText: obscureText,
        style: context.styles.textStyle.copyWith(fontSize: 25),
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        cursorHeight: 25,
        decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.zero,
          fillColor: context.colors.secondary,
          focusColor: context.colors.secondary,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: context.colors.textColor),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.colors.primary),
            borderRadius: BorderRadius.circular(15),
          ),
          label: Center(
            child: Text(
              label,
              style: context.styles.textStyle.copyWith(
                color: context.colors.textColor.withValues(alpha: 0.5),
                fontSize: 25,
              ),
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }
}
