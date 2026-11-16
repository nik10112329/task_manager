import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:task_manager/app/extensions/context.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/ghost_swipe_controller.dart';
import 'package:task_manager/app/widgets/ghost_swipe_hint.dart';
import 'package:task_manager/features/notifications/bloc/notifications_bloc.dart';
import 'package:task_manager/features/notifications/view/notification_item.dart';

@RoutePage()
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({
    required this.navBarShadowNotifier,
    required this.appBarShadowNotifier,
    this.tabIndex = 1,
    super.key,
  });

  final ValueNotifier<bool> navBarShadowNotifier;
  final ValueNotifier<bool> appBarShadowNotifier;
  final int tabIndex;

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with AutoRouteAwareStateMixin<NotificationsScreen> {
  late final NotificationsBloc _bloc;
  late final ScrollController _scrollController = ScrollController();
  bool _headerShadow = false;
  late final int tabIndex = widget.tabIndex;
  TabsRouter? _tabsRouter;
  final GhostSwipeHintController _ghostSwipeHintController =
      GhostSwipeHintController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newRouter = AutoTabsRouter.of(context);
    if (_tabsRouter != newRouter) {
      _tabsRouter?.removeListener(_onTabChanged);
      _tabsRouter = newRouter;
      _tabsRouter!.addListener(_onTabChanged);
    }
  }

  void _onTabChanged() {
    if (_tabsRouter!.activeIndex == tabIndex) _resetShadows();

    if (mounted) _ghostSwipeHintController.replay();
  }

  void _onScroll() {
    widget.appBarShadowNotifier.value = false;
    if (!_scrollController.hasClients) return;

    final offset = _scrollController.offset;
    final max = _scrollController.position.maxScrollExtent;

    final hasNotifications = _bloc.state.notifications.isNotEmpty;

    final newHeader = offset > 8;
    final newNav = hasNotifications && offset < max - 8;

    if (newHeader != _headerShadow) {
      setState(() => _headerShadow = newHeader);
    }
    widget.navBarShadowNotifier.value = newNav;
  }

  void _resetShadows() {
    widget.appBarShadowNotifier.value = false;

    bool showNavShadow = false;
    if (_scrollController.hasClients) {
      final offset = _scrollController.offset;
      final max = _scrollController.position.maxScrollExtent;
      final hasNotifications = _bloc.state.notifications.isNotEmpty;
      showNavShadow = hasNotifications && offset < max - 8;
    }
    widget.navBarShadowNotifier.value = showNavShadow;
  }

  @override
  void initState() {
    super.initState();
    _bloc = context.dependencies.notificationsBloc;
    _bloc.add(const NotificationsEvent.load());

    _scrollController.addListener(_onScroll);
    _bloc.stream.listen((state) {
      if (mounted) _resetShadows();
    });
  }

  @override
  void dispose() {
    _tabsRouter?.removeListener(_onTabChanged);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        bloc: _bloc,
        builder: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_scrollController.hasClients) _onScroll();
          });
          return CustomScrollView(
            controller: _scrollController,
            physics: state.notifications.isEmpty
                ? const NeverScrollableScrollPhysics()
                : null,
            slivers: [
              state.notifications.isEmpty
                  ? const SliverToBoxAdapter(child: SizedBox.shrink())
                  : SliverPersistentHeader(
                      pinned: true,
                      delegate: _TitleDelegate(
                        showShadow: _headerShadow,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 45),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              S.of(context).notifications_with_colon,
                              style: context.styles.h1.copyWith(fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                    ),
              state.isLoading
                  ? const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : (state.notifications.isEmpty)
                  ? SliverFillRemaining(
                      child: Center(
                        child: Text(
                          S.of(context).no_notifications_yet,
                          style: context.styles.textStyle.copyWith(
                            color: context.colors.textColor.withValues(
                              alpha: 0.6,
                            ),
                          ),
                        ),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final notification = state.notifications[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              boxShadow: [context.colors.standardShadow],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: GhostSwipeHint(
                                backgroundColor: context.colors.primary,
                                controller: index == 0
                                    ? _ghostSwipeHintController
                                    : null,
                                duration: index == 0
                                    ? const Duration(milliseconds: 700)
                                    : Duration.zero,
                                child: TMNotificationItem(
                                  onTap: () {
                                    if (!notification.isRead) {
                                      _bloc.add(
                                        NotificationsEvent.markAsRead(
                                          notification.id,
                                        ),
                                      );
                                    }
                                  },
                                  onDismissed: () {
                                    _bloc.add(
                                      NotificationsEvent.delete(
                                        notification.id,
                                      ),
                                    );
                                  },
                                  notification: notification,
                                ),
                              ),
                            ),
                          ),
                        );
                      }, childCount: state.notifications.length),
                    ),
            ],
          );
        },
      ),
    );
  }
}

class _TitleDelegate extends SliverPersistentHeaderDelegate {
  const _TitleDelegate({required this.child, required this.showShadow});

  final Widget child;
  final bool showShadow;

  @override
  double get minExtent => 48;

  @override
  double get maxExtent => 48;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: context.colors.background,
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: context.colors.textColor.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, -3),
                ),
              ]
            : [],
      ),
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant _TitleDelegate oldDelegate) =>
      oldDelegate.showShadow != showShadow;
}
