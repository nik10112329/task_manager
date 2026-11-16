import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/app/router/app_router.gr.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';
import 'package:task_manager/app/widgets/wrappers/shadow_scroll_wrapper.dart';
import 'package:task_manager/features/tasks_archive/widgets/archive_scope.dart';

@RoutePage()
class TMSelectedProjectArchiveScreen extends StatefulWidget {
  const TMSelectedProjectArchiveScreen({super.key});

  @override
  State<TMSelectedProjectArchiveScreen> createState() =>
      _TMSelectedProjectArchiveScreenState();
}

class _TMSelectedProjectArchiveScreenState
    extends State<TMSelectedProjectArchiveScreen> {
  late final ScrollController _scrollController = ScrollController();
  bool showShadow = false;

  // late final ArchiveScope archive;
  // late final List<TMProject> projects;

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
    final archive = ArchiveScope.of(context);
    final projects = archive.projects;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Выберите проект',
            style: context.styles.h1.copyWith(fontSize: 24),
          ),
        ),

        const SizedBox(height: 20),

        Expanded(
          child: TMShadowScrollWrapper(
            scrollController: _scrollController,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Clickable(
                    onTap: () {
                      context.router.push(
                        TMTasksArchiveRoute(project: projects[index]),
                      );
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        gradient: context.colors.primaryGradient.withOpacity(
                          0.8,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        project.name,
                        textAlign: TextAlign.center,
                        style: context.styles.textStyle.copyWith(
                          fontSize: 24,
                          color: context.colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
