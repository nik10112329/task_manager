import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/app/extensions/enum/localize_enum.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/buttons/button.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';
import 'package:task_manager/app/widgets/wrappers/shadow_scroll_wrapper.dart';

@JsonEnum(valueField: 'value')
enum SortType implements LocalizedEnum {
  status,
  deadline;

  @override
  String title(BuildContext context) {
    final s = S.of(context);

    switch (this) {
      case SortType.status:
        return s.by_status;
      case SortType.deadline:
        return s.by_deadline;
    }
  }
}

class TMSortBottomSheet extends StatefulWidget {
  const TMSortBottomSheet({
    required this.onChanged,
    this.isAscOrder,
    this.selectedSort,
    super.key,
  });

  final void Function({SortType? selectedSort, bool? isAscOrder}) onChanged;
  final SortType? selectedSort;
  final bool? isAscOrder;

  @override
  State<TMSortBottomSheet> createState() => _TMSortBottomSheetState();
}

class _TMSortBottomSheetState extends State<TMSortBottomSheet> {
  List<SortType> sortList = SortType.values;
  late SortType? selectedSort = widget.selectedSort;
  late bool isAscOrder = widget.isAscOrder ?? false;
  late final ScrollController _scrollController = ScrollController();
  bool showShadow = false;

  void _updateShadows() {
    if (!_scrollController.hasClients || !mounted) {
      return;
    }

    final offset = _scrollController.offset;

    showShadow = offset > 8;
    if (mounted) setState(() {});
  }

  void _onScroll() {
    _updateShadows();
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ).copyWith(bottom: 100),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Сортировка задач:', style: context.styles.h1),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: TMShadowScrollWrapper(
                    scrollController: _scrollController,
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              const SizedBox(height: 8),
                              ...List.generate(SortType.values.length, (index) {
                                final sortType = SortType.values[index];

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ).copyWith(bottom: 10),
                                  child: Clickable(
                                    onTap: () {
                                      setState(() {
                                        if (selectedSort == sortType) {
                                          isAscOrder = !isAscOrder;
                                        } else {
                                          selectedSort = sortType;
                                          isAscOrder = true;
                                        }
                                      });
                                    },
                                    child: Container(
                                      width:
                                          MediaQuery.sizeOf(context).width - 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: context.colors.secondary,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            sortType.title(context),
                                            style: context.styles.textStyle,
                                          ),
                                          if (sortType == selectedSort)
                                            Icon(
                                              isAscOrder
                                                  ? Icons.keyboard_arrow_down
                                                  : Icons.keyboard_arrow_up,
                                              color: context.colors.iconColor,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                              const SizedBox(height: 80),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 15,
          right: 15,
          child: TMButton(
            content: Text(
              'Применить',
              style: context.styles.h1.copyWith(
                fontSize: 18,
                color: context.colors.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              widget.onChanged(
                selectedSort: selectedSort,
                isAscOrder: isAscOrder,
              );
              context.pop();
            },
          ),
        ),
      ],
    );
  }
}
