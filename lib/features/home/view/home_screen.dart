import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:task_manager/app/extensions/context.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/router/app_router.gr.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/values/tm_icons.dart';
import 'package:task_manager/app/widgets/carousels/card_page_indicator.dart';
import 'package:task_manager/app/widgets/carousels/filters_carousel.dart';
import 'package:task_manager/app/widgets/carousels/shimmers/projects_carousel_shimmer.dart';
import 'package:task_manager/app/widgets/hamburger_menu/hamburger_menu.dart';
import 'package:task_manager/app/widgets/icon_button.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';
import 'package:task_manager/features/home/bloc/home_bloc.dart';
import 'package:task_manager/features/home/models/task_status/task_status.dart';
import 'package:task_manager/features/home/view/carousels_selection.dart';
import 'package:task_manager/features/home/view/models/home_card_data.dart';
import 'package:task_manager/features/home/view/models/home_filter.dart';
import 'package:task_manager/features/home/view/utils/home_utils.dart';
import 'package:task_manager/features/project/models/project/project.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.profileWidgetNotifier,
    required this.navBarShadowNotifier,
    required this.appBarShadowNotifier,
    this.tabIndex = 0,
    super.key,
  });

  final ValueNotifier<bool> navBarShadowNotifier;
  final ValueNotifier<bool> appBarShadowNotifier;
  final ValueNotifier<Widget?> profileWidgetNotifier;
  final int tabIndex;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTag = 0;
  int selectedElement = 0;
  late final int tabIndex = widget.tabIndex;

  TabsRouter? _tabsRouter;
  VoidCallback? _tabListener;
  late final user = HomeUtils.fetchProfileData(
    context.dependencies.authBloc.state.user,
  );

  final List<TMHomeCardData> projects = [];
  final Map<String, List<TMHomeCardData>> tasksMap = {};
  final List<TMHomeCardData> currentProjectInProgressTasks = [];

  late final HomeBloc _homeBloc;

  final double horizontalPadding = 32.5;

  final tags = ['Projects', 'My Tasks', ...TaskStatus.allValuesNormalFormatted];

  HomeFilter _filter = const ProjectsFilter();

  late final ScrollController _scrollController = ScrollController();

  void _updateShadows() {
    if (!_scrollController.hasClients || !mounted) {
      return;
    }

    final offset = _scrollController.offset;
    final max = _scrollController.position.maxScrollExtent;

    tasksMap
      ..clear()
      ..addAll(HomeUtils.fetchTasksFromProject(_homeBloc.state.tasks));
    final currentProjectId =
        projects.isNotEmpty && selectedElement < projects.length
        ? projects[selectedElement].id
        : null;
    final tasksInProject = currentProjectId != null
        ? tasksMap[currentProjectId] ?? []
        : [];
    final hasTasks = tasksInProject.isNotEmpty;

    final showAppBar = offset > 8;
    final showNavBar = hasTasks && offset < max - 8;

    widget.appBarShadowNotifier.value = showAppBar;
    widget.navBarShadowNotifier.value = showNavBar;

    if (mounted) setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newRouter = AutoTabsRouter.of(context);
    if (_tabsRouter != newRouter) {
      _tabsRouter?.removeListener(_onTabChanged);
      _tabsRouter = newRouter;
      _tabListener = _onTabChanged;
      _tabsRouter!.addListener(_tabListener!);
    }
    _updateProfileWidget();
  }

  void _onTabChanged() {
    if (_tabsRouter!.activeIndex == tabIndex) {
      _updateShadows();
    }
  }

  void _onScroll() {
    _updateShadows();
  }

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc(repository: context.dependencies.homeRepository)
      ..add(
        HomeEvent.initialize(
          userId: context.dependencies.authBloc.state.user?.id,
        ),
      );
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _updateShadows();
    });
  }

  void _updateProfileWidget() {
    final avatarWidget = user?.profileImage != null
        ? Clickable(
            onTap: () => context.pushRoute(const ProfileRoute()),
            child: ClipOval(
              child: SizedBox(
                width: 28,
                height: 28,
                child: CachedNetworkImage(
                  imageUrl: user!.profileImage ?? '',
                  fit: BoxFit.cover,
                  placeholder: (_, _) => Icon(
                    TmIcons.profile,
                    color: context.colors.iconColor,
                    size: 28,
                  ),
                  errorWidget: (_, _, _) =>
                      Icon(Icons.error, color: context.colors.primary),
                ),
              ),
            ),
          )
        : TMIconButton(
            onTap: () => context.pushRoute(const ProfileRoute()),
            iconSize: 28,
            iconData: TmIcons.profile,
            color: context.colors.iconColor,
          );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.profileWidgetNotifier.value = avatarWidget;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      drawer: const HamburgerMenu(),
      body: SafeArea(
        child: BlocBuilderWithSideEffects<HomeBloc, HomeState, HomeSideEffect>(
          bloc: _homeBloc,
          sideEffectsListener: (context, sideEffect) {
            sideEffect.mapOrNull(
              projectFetched: (sideEffect) {
                projects
                  ..clear()
                  ..addAll(
                    HomeUtils.fetchProjectsData(_homeBloc.state.projects),
                  );
                _homeBloc.add(
                  HomeEvent.fetchTasks(
                    projectsIds:
                        _homeBloc.state.projects
                            ?.map((project) => project.id)
                            .toList() ??
                        [],
                  ),
                );
              },
              tasksFetched: (sideEffect) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => _updateShadows(),
                );
              },
              taskAdded: (sideEffect) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => _updateShadows(),
                );
              },
              projectUpdated: (sideEffect) {
                setState(() {
                  projects
                    ..clear()
                    ..addAll(
                      HomeUtils.fetchProjectsData(_homeBloc.state.projects),
                    );
                });
              },
              taskUpdated: (sideEffect) {
                setState(() {
                  projects
                    ..clear()
                    ..addAll(
                      HomeUtils.fetchProjectsData(_homeBloc.state.projects),
                    );
                });
              },
            );
          },
          builder: (context, state) {
            tasksMap
              ..clear()
              ..addAll(HomeUtils.fetchTasksFromProject(_homeBloc.state.tasks));
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(left: horizontalPadding),
                        child: Text(
                          S.of(context).welcome_message(user?.firstName ?? ''),
                          style: context.styles.h1,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: EdgeInsets.only(left: horizontalPadding),
                        child: Text(
                          S.of(context).welcome_wishes,
                          style: context.styles.subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TMFiltersCarousel(
                        tags: tags,
                        selectIndex: selectedTag,
                        onTapTask: (int selectedIndex) {
                          setState(() {
                            selectedTag = selectedIndex;
                            projects.clear();
                            if (selectedIndex == 0) {
                              projects.addAll(
                                HomeUtils.fetchProjectsData(state.projects),
                              );
                            }
                            _filter = HomeFilter.fromIndex(selectedIndex);
                            selectedElement = 0;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      state.isLoadingProjects
                          ? const TMProjectsCarouselShimmer()
                          : Column(
                              children: [
                                CarouselsSelection(
                                  isAddNewElement: true,
                                  data: projects,
                                  filter: _filter,
                                  onTapNewElement: () {
                                    context.pushRoute(
                                      CreateProjectRoute(
                                        createProject: (TMProject project) {
                                          _homeBloc.add(
                                            HomeEvent.addProject(
                                              project: project,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  onTapData: () {
                                    if (state.projects != null) {
                                      context.pushRoute(
                                        ProjectRoute(
                                          project:
                                              state.projects![selectedElement],
                                          onChanged: () {
                                            _homeBloc
                                              ..add(
                                                HomeEvent.initialize(
                                                  userId: context
                                                      .dependencies
                                                      .authBloc
                                                      .state
                                                      .user
                                                      ?.id,
                                                ),
                                              )
                                              ..add(
                                                HomeEvent.fetchTasks(
                                                  projectsIds:
                                                      _homeBloc.state.projects
                                                          ?.map(
                                                            (project) =>
                                                                project.id,
                                                          )
                                                          .toList() ??
                                                      [],
                                                ),
                                              );
                                          },
                                        ),
                                      );
                                    }
                                  },
                                  onLongPressData: () {},
                                  onChangeItem: (index) {
                                    setState(() {
                                      selectedElement = index;
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                            if (mounted) _updateShadows();
                                          });
                                    });
                                  },
                                ),
                                const SizedBox(height: 16),
                                if (projects.length > 1)
                                  TMCardPageIndicator(
                                    count: projects.length,
                                    currentIndex: selectedElement,
                                  ),
                              ],
                            ),
                      const SizedBox(height: 35),
                      if (selectedElement < projects.length)
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding,
                          ),
                          child: Text(
                            S.of(context).tasks,
                            style: context.styles.h1.copyWith(fontSize: 26),
                          ),
                        ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                if (selectedElement < projects.length)
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.5),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final currentProjectId = projects.isNotEmpty
                              ? projects[selectedElement].id
                              : null;
                          final List<TMHomeCardData> tasksInProject =
                              currentProjectId != null
                              ? tasksMap[currentProjectId] ?? []
                              : [];
                          if (index >= tasksInProject.length) {
                            return const SizedBox.shrink();
                          }

                          final task = tasksInProject[index];

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: SizedBox(
                              height: 80,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: context.colors.secondary,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Row(
                                    children: [
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          gradient:
                                              context.colors.primaryGradient,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Icon(
                                            TmIcons.taskList,
                                            size: 20,
                                            color: context.colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            task.name,
                                            style: context.styles.textStyle
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Text(
                                            '2 days ago',
                                            style: context.styles.textStyle
                                                .copyWith(
                                                  color: context
                                                      .colors
                                                      .iconDisable,
                                                  fontSize: 12,
                                                ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.more_vert,
                                        color: context.colors.iconDisable,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: projects.isNotEmpty
                            ? (tasksMap[projects[selectedElement].id] ?? [])
                                  .length
                            : 0,
                      ),
                    ),
                  ),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
              ],
            );
          },
        ),
      ),
    );
  }
}
