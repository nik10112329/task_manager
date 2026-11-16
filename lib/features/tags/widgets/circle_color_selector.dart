import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:task_manager/app/extensions/color.dart';
import 'package:task_manager/app/extensions/string.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';

class TMCircleColorSelector extends StatefulWidget {
  const TMCircleColorSelector({
    required this.hexController,
    required this.colorPickerController,
    super.key,
  });

  final CircleColorPickerController colorPickerController;
  final TextEditingController hexController;

  @override
  State<TMCircleColorSelector> createState() => _TMCircleColorSelectorState();
}

class _TMCircleColorSelectorState extends State<TMCircleColorSelector> {
  @override
  Widget build(BuildContext context) {
    return CircleColorPicker(
      onChanged: (color) {
        setState(() {
          widget.colorPickerController.color = color;
          widget.hexController.text = color.formattedHex();
        });
      },
      controller: widget.colorPickerController,
      size: const Size(300, 300),
      strokeWidth: 8,
      thumbSize: 30,
      colorCodeBuilder: (context, color) {
        return SizedBox(
          width: 110,
          height: 36,
          child: TextField(
            controller: widget.hexController,
            textAlign: TextAlign.center,
            textCapitalization: TextCapitalization.characters,
            style: context.styles.h1.copyWith(
              fontSize: 16,
              color: context.colors.textColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              prefixText: '#',
              prefixStyle: context.styles.h1.copyWith(
                fontSize: 16,
                color: context.colors.textColor,
                fontWeight: FontWeight.w600,
              ),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 4,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: context.colors.secondary.withValues(alpha: 0.5),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: context.colors.white.withValues(alpha: 0.5),
                ),
              ),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9A-Fa-f]')),
              LengthLimitingTextInputFormatter(6),
            ],
            onChanged: (value) {
              setState(() {
                final parsed = value.parseHex();
                if (parsed != null) {
                  setState(() {
                    widget.colorPickerController.color = parsed;
                  });
                }
              });
            },
          ),
        );
      },
      textStyle: context.styles.h1.copyWith(
        fontSize: 20,
        color: context.colors.secondary,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
