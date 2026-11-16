import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/app/router/app_router.gr.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/values/tm_icons.dart';
import 'package:task_manager/app/widgets/app_bar/app_bar.dart';
import 'package:task_manager/app/widgets/hamburger_menu/hamburger_menu.dart';
import 'package:task_manager/app/widgets/icon_button.dart';
import 'package:task_manager/app/widgets/nav_bar/nav_bar.dart';

@RoutePage()
class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final navBarShadowNotifier = ValueNotifier<bool>(false);
  final appBarShadowNotifier = ValueNotifier<bool>(false);
  final profileWidgetNotifier = ValueNotifier<Widget?>(null);

  @override
  void dispose() {
    navBarShadowNotifier.dispose();
    appBarShadowNotifier.dispose();
    profileWidgetNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      drawer: const HamburgerMenu(),
      drawerScrimColor: context.colors.darkAccent.withValues(alpha: 0.6),
      routes: [
        HomeRoute(
          navBarShadowNotifier: navBarShadowNotifier,
          profileWidgetNotifier: profileWidgetNotifier,
          appBarShadowNotifier: appBarShadowNotifier,
        ),
        NotificationsRoute(
          navBarShadowNotifier: navBarShadowNotifier,
          appBarShadowNotifier: appBarShadowNotifier,
        ),
      ],
      appBarBuilder: (_, tabsRouter) {
        return TMAppBar(
          shadowNotifier: appBarShadowNotifier,
          backgroundColor: context.colors.background,
          trailingPadding: const EdgeInsets.only(right: 32.5),
          leadingPadding: const EdgeInsets.only(left: 32.5),
          leading: Builder(
            builder: (scaffoldContext) => Center(
              child: TMIconButton(
                onTap: () => Scaffold.of(scaffoldContext).openDrawer(),
                iconSize: 25,
                iconData: TmIcons.menu,
                color: context.colors.iconColor,
              ),
            ),
          ),
          profileWidgetNotifier: profileWidgetNotifier,
        );
      },
      bottomNavigationBuilder: (_, tabsRouter) {
        return ValueListenableBuilder<bool>(
          valueListenable: navBarShadowNotifier,
          builder: (_, showShadow, child) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                boxShadow: showShadow
                    ? [
                        BoxShadow(
                          color: context.colors.textColor.withValues(
                            alpha: 0.15,
                          ),
                          blurRadius: 8,
                          offset: const Offset(0, -3),
                        ),
                      ]
                    : [],
              ),
              child: child,
            );
          },

          child: TMNavBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              appBarShadowNotifier.value = false;
              navBarShadowNotifier.value = false;
              tabsRouter.setActiveIndex(index);
            },
          ),
        );
      },
    );
  }
}
