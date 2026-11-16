import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:task_manager/app/extensions/color.dart';
import 'package:task_manager/app/extensions/context.dart';
import 'package:task_manager/app/formatters/hash_input_formatter.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/utils/validators.dart';
import 'package:task_manager/app/widgets/icon_button.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';
import 'package:task_manager/features/tags/bloc/tags_bloc.dart';
import 'package:task_manager/features/tags/models/tag/tag.dart';
import 'package:task_manager/features/tags/utils/tags_utils.dart';
import 'package:task_manager/features/tags/widgets/color_selector_window.dart';
import 'package:task_manager/features/tags/widgets/tags_horizontal_list.dart';

class TMTagSelectedWindow extends StatefulWidget {
  const TMTagSelectedWindow({
    required this.onChanged,
    required this.selected,
    required this.projectTags,
    required this.onAddNewTag,
    required this.isLoading,
    super.key,
  });

  final List<TMTaskTag> selected;

  final Function(List<TMTaskTag> tags) onChanged;
  final Function(TMTaskTag tag) onAddNewTag;
  final List<String> projectTags;
  final bool isLoading;

  @override
  State<TMTagSelectedWindow> createState() => _TMTagSelectedWindowState();
}

class _TMTagSelectedWindowState extends State<TMTagSelectedWindow> {
  final TextEditingController searchController = TextEditingController();

  late List<TMTaskTag> _allTags;
  late List<TMTaskTag> _selected;

  bool isEntryTag = true;
  late final TagsBloc _tagsBloc = TagsBloc(
    repository: context.dependencies.projectsRepository,
  );
  Color? selectColor;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchController.addListener(() {
        setState(() {});
      });
      _tagsBloc.add(TagsEvent.fetchTags(tagsIds: widget.projectTags));
    });
    _selected = [...widget.selected];
  }

  @override
  void dispose() {
    searchController
      ..removeListener(() {})
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TagsBloc, TagsState>(
      bloc: _tagsBloc,
      builder: (context, state) {
        _allTags = [
          ...state.tags.where((t) => widget.selected.contains(t)),
          ...state.tags.where((t) => !widget.selected.contains(t)),
        ];

        return state.isLoading || widget.isLoading
            ? Center(
                child: CircularProgressIndicator(color: context.colors.primary),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 150,
                  horizontal: 10,
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  decoration: BoxDecoration(color: context.colors.transparent),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: context.colors.background,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Material(
                      color: context.colors.background,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _header(),
                          const SizedBox(height: 30),
                          _search(selectColor),
                          const SizedBox(height: 10),
                          Expanded(child: _tagsGrid()),
                          const SizedBox(height: 10),
                          _saveButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Tags', style: context.styles.h1.copyWith(fontSize: 25)),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.close),
        ),
      ],
    );
  }

  Widget _search(Color? color) {
    final isBlackColor =
        Theme.of(context).brightness == Brightness.light &&
        color != null &&
        color.isBlackColor();
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            inputFormatters: [HashPrefixFormatter()],
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                size: 30,
                color: isBlackColor
                    ? context.colors.secondary.withValues(alpha: 0.8)
                    : context.colors.textColor,
              ),
              hint: Text(
                S.of(context).search_or_create_tags,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.styles.textStyle.copyWith(
                  color: isBlackColor
                      ? context.colors.secondary.withValues(alpha: 0.8)
                      : context.colors.textColor,
                  fontSize: 16,
                ),
              ),
              filled: true,
              suffixIcon: !isEntryTag
                  ? GestureDetector(
                      onTap: () {
                        final newTag = TagsUtils.createTagWithId(
                          name: searchController.text,
                          color: color,
                        );
                        _allTags.add(newTag);
                        _tagsBloc.add(
                          TagsEvent.fetchTags(
                            tagsIds: _allTags.map((tag) => tag.id).toList(),
                          ),
                        );
                        setState(() {});
                        widget.onAddNewTag(newTag);
                      },
                      child: Icon(
                        Icons.check,
                        size: 20,
                        color: isBlackColor
                            ? context.colors.secondary.withValues(alpha: 0.8)
                            : context.colors.textColor,
                      ),
                    )
                  : null,
              fillColor: selectColor ?? context.colors.secondary.withValues(
                alpha: 0.7
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              isEntryTag = Validators.tagValidator(
                value,
                existingTags: _allTags,
              );
            },
            style: context.styles.h1.copyWith(
              fontSize: 18,
              color: isBlackColor
                  ? context.colors.white.withValues(alpha: 0.8)
                  : context.colors.textColor,
            ),
          ),
        ),
        const SizedBox(width: 15),
        TMIconButton(
          iconSize: 25,
          color: context.colors.textColor,
          iconData: Icons.color_lens_outlined,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return TMColorSelectorWindow(
                  selectColor: selectColor,
                  onChanged: (color) {
                    setState(() {
                      selectColor = color;
                    });
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _tagsGrid() {
    final query = searchController.text.toUpperCase();
    final List<TMTaskTag> filtered = [];
    if (query == '' || query.isEmpty) {
      filtered
        ..clear()
        ..addAll(_allTags);
    } else {
      filtered.addAll(
        _allTags.where((tag) {
          return tag.name.toUpperCase().contains(query);
        }).toList(),
      );
    }
    return SingleChildScrollView(
      child: AnimatedSwitcher(
        transitionBuilder: (child, animation) =>
            FadeTransition(opacity: animation, child: child),
        duration: const Duration(milliseconds: 300),
        child: SizedBox(
          height: 250,
          child: TMScrollableFade(
            key: ValueKey(query),
            scrollDirection: Axis.vertical,
            child: Wrap(
              spacing: 7,
              runSpacing: 12,
              children: filtered.map((tagItem) {
                final isSelected = _selected.contains(tagItem);
                return Clickable(
                  onTap: () {
                    setState(() {
                      _selected.contains(tagItem)
                          ? _selected.remove(tagItem)
                          : _selected.add(tagItem);
                    });
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      gradient: tagItem.color == null
                          ? context.colors.primaryGradient.withOpacity(
                              isSelected ? 0.5 : 0.3,
                            )
                          : null,
                      color: tagItem.color != null
                          ? Color(
                              tagItem.color!,
                            ).withValues(alpha: isSelected ? 0.8 : 0.5)
                          : null,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 15,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isSelected)
                            Icon(
                              Icons.check,
                              color: context.colors.textColor,
                              size: 15,
                            ),
                          const SizedBox(width: 5),
                          Text(
                            tagItem.name.toUpperCase(),
                            style: context.styles.textStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _saveButton() {
    return Clickable(
      onTap: () {
        widget.onChanged(_selected);
        context.pop();
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: context.colors.primary,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [context.colors.standardShadow],
        ),
        child: Center(
          child: Text(
            S.of(context).save_changes,
            style: context.styles.textStyle.copyWith(
              color: context.colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
