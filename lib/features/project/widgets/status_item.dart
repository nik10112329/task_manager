import 'package:flutter/material.dart';
import 'package:task_manager/app/extensions/enum/task_status.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/buttons/button.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';
import 'package:task_manager/features/home/models/task_status/task_status.dart';

class TMStatusItem extends StatefulWidget {
  const TMStatusItem({
    required this.onChange,
    required this.currentStatus,
    super.key,
  });

  final TaskStatus currentStatus;
  final Function(TaskStatus status) onChange;

  @override
  State<TMStatusItem> createState() => _TMStatusItemState();
}

class _TMStatusItemState extends State<TMStatusItem> {
  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => _StatusBottomSheet(
            currentStatus: widget.currentStatus,
            onChange: widget.onChange,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2.5),
        decoration: BoxDecoration(
          color: widget.currentStatus.color.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: widget.currentStatus.color),
        ),
        child: Text(
          widget.currentStatus.label.toUpperCase(),
          textAlign: TextAlign.center,
          style: context.styles.textStyle.copyWith(
            fontSize: 12,
            color: widget.currentStatus.color,
          ),
        ),
      ),
    );
  }
}

// Отдельный виджет для bottom sheet
class _StatusBottomSheet extends StatefulWidget {
  const _StatusBottomSheet({
    required this.currentStatus,
    required this.onChange,
  });

  final TaskStatus currentStatus;
  final Function(TaskStatus status) onChange;

  @override
  State<_StatusBottomSheet> createState() => _StatusBottomSheetState();
}

class _StatusBottomSheetState extends State<_StatusBottomSheet> {
  int? selectedIndex;
  late final ScrollController _scrollController = ScrollController();
  bool showShadow = false;

  void _updateShadows() {
    if (!_scrollController.hasClients || !mounted) return;
    final offset = _scrollController.offset;
    final newShowShadow = offset > 8;

    if (newShowShadow != showShadow) {
      setState(() => showShadow = newShowShadow);
    }
  }

  @override
  void initState() {
    super.initState();
    selectedIndex = TaskStatus.values.indexOf(widget.currentStatus);
    _scrollController.addListener(_updateShadows);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateShadows());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.6,
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 50),
                Text('Выберите статус', style: context.styles.h1),
                const SizedBox(height: 30),

                // Тень
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  height: showShadow ? 0.8 : 0,
                  decoration: BoxDecoration(
                    color: context.colors.iconDisable,
                    boxShadow: showShadow
                        ? [
                            context.colors.standardShadow.copyWith(
                              spreadRadius: 0.6,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : [],
                  ),
                ),

                Expanded(
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(16),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: TaskStatus.values.length,
                            itemBuilder: (context, index) {
                              final status = TaskStatus.values[index];
                              final isSelected = index == selectedIndex;

                              return Clickable(
                                onTap: () {
                                  setState(() => selectedIndex = index);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 24,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                        color: context.colors.iconDisable,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: status.color.withValues(
                                                  alpha: 0.3,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                border: Border.all(
                                                  color: status.color,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  10,
                                                ),
                                                child: Icon(
                                                  status.icon,
                                                  color: status.color,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            Text(
                                              status.label,
                                              style: context.styles.textStyle
                                                  .copyWith(
                                                    fontSize: 16,
                                                    color: status.color,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        if (isSelected)
                                          Icon(
                                            Icons.check,
                                            color: context.colors.iconColor,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TMButton(
                  onTap: () {
                    if (selectedIndex != null) {
                      widget.onChange(TaskStatus.values[selectedIndex!]);
                    }
                    Navigator.pop(context);
                  },
                  content: Text(
                    'Подтвердить',
                    style: context.styles.textStyle.copyWith(
                      color: context.colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
