import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:task_manager/app/extensions/color.dart';
import 'package:task_manager/app/extensions/string.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/icon_button.dart';
import 'package:task_manager/features/tags/widgets/circle_color_gradient.dart';
import 'package:task_manager/features/tags/widgets/circle_color_selector.dart';

class TMColorSelectorWindow extends StatefulWidget {
  const TMColorSelectorWindow({
    required this.onChanged,
    this.selectColor,
    super.key,
  });

  final Function(Color? color) onChanged;
  final Color? selectColor;

  @override
  State<TMColorSelectorWindow> createState() => _TMColorSelectorWindowState();
}

class _TMColorSelectorWindowState extends State<TMColorSelectorWindow> {
  late final Color initialColor = context.colors.iconDisable;
  late final String initialColorHex =
      widget.selectColor?.toString() ?? context.colors.iconDisable.toString();
  bool _useGradient = false;
  late final TextEditingController hexController = TextEditingController(
    text: (widget.selectColor ?? context.colors.iconDisable).formattedHex(),
  );
  late final CircleColorPickerController colorPickerController =
      CircleColorPickerController(
        initialColor: widget.selectColor ?? context.colors.iconDisable,
      );

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      colorPickerController.addListener(() => setState(() {}));
    });
    super.initState();
  }

  @override
  void dispose() {
    hexController.dispose();
    colorPickerController
      ..dispose()
      ..removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 225),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colors.secondary.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Material(
          color: context.colors.transparent,
          child: Stack(
            children: [
              Center(
                child: _useGradient
                    ? TMCircleColorGradient(
                        controller: colorPickerController,
                        gradient: context.colors.primaryGradient,
                      )
                    : TMCircleColorSelector(
                        colorPickerController: colorPickerController,
                        hexController: hexController,
                      ),
              ),
              Positioned(
                right: 15,
                bottom: 15,
                child: TMIconButton(
                  iconData: Icons.check,
                  onTap: () {
                    widget.onChanged(colorPickerController.color);
                    context.pop();
                  },
                  color: context.colors.textColor,
                ),
              ),
              Positioned(
                left: 15,
                top: 15,
                child: TMIconButton(
                  iconData: Icons.clear,
                  onTap: () {
                    colorPickerController.color = initialColor;
                    hexController.text = initialColorHex;
                    context.pop();
                  },
                  color: context.colors.textColor,
                ),
              ),
              Positioned(
                right: 5,
                child: GestureDetector(
                  onTap: () => setState(() => _useGradient = !_useGradient),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Градиент'.hardCoded,
                        style: context.styles.textStyle,
                      ),
                      Checkbox(
                        value: _useGradient,
                        checkColor: context.colors.textColor,
                        fillColor: WidgetStateProperty.resolveWith(
                          (states) =>
                              context.colors.white.withValues(alpha: 0.1),
                        ),
                        side: WidgetStateBorderSide.resolveWith(
                          (states) => BorderSide(
                            color: context.colors.textColor,
                            width: 1.5,
                          ),
                        ),
                        onChanged: (v) =>
                            setState(() => _useGradient = v ?? false),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
