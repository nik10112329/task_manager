import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/app/auth/bloc/auth_bloc.dart';
import 'package:task_manager/app/extensions/context.dart';
import 'package:task_manager/app/extensions/enum/localize_enum.dart';
import 'package:task_manager/app/extensions/string.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/router/app_router.gr.dart';
import 'package:task_manager/app/theme/app_theme_data.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/values/assets.gen.dart';
import 'package:task_manager/app/values/tm_icons.dart';
import 'package:task_manager/app/widgets/app_bar/app_bar.dart';
import 'package:task_manager/app/widgets/icon_button.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';
import 'package:task_manager/features/profile/view/utils/profile_utils.dart';

enum HamburgerMenuItem implements LocalizedEnum {
  settings,
  tasksArchive,
  reports,
  profile,
  aboutApp;

  @override
  String title(BuildContext context) {
    final s = S.of(context);

    switch (this) {
      case HamburgerMenuItem.settings:
        return s.settings;
      case HamburgerMenuItem.tasksArchive:
        return S.of(context).task_archive;
      case HamburgerMenuItem.reports:
        return S.of(context).reports;
      case HamburgerMenuItem.profile:
        return S.of(context).profile;
      case HamburgerMenuItem.aboutApp:
        return S.of(context).about_app;
    }
  }

  VoidCallback onTap(BuildContext context) {
    switch (this) {
      case HamburgerMenuItem.settings:
        return () {};
      case HamburgerMenuItem.tasksArchive:
        return () => context.pushRoute(const TMArchiveWrapperRoute());
      case HamburgerMenuItem.profile:
        return () {};
      case HamburgerMenuItem.aboutApp:
        return () {};
      case HamburgerMenuItem.reports:
        return () {};
    }
  }
}

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ProfileUtils.profileData(
      context.dependencies.authBloc.state.user,
    );
    return context.dependencies.authBloc.state.isLoading
        ? const CircularProgressIndicator()
        : Container(
            width: MediaQuery.sizeOf(context).width * 0.7,
            decoration: BoxDecoration(
              color: context.colors.background,
              boxShadow: [
                BoxShadow(
                  color: context.colors.white.withValues(alpha: 0.2),
                  blurRadius: 16,
                  offset: const Offset(10, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: SvgPicture.asset(
                          Assets.images.cardBackground,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        top: 100,
                        child: Column(
                          children: [
                            user?.profileImage != null
                                ? ClipOval(
                                    child: SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: CachedNetworkImage(
                                        imageUrl: user!.profileImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: TMIconButton(
                                      onTap: () {},
                                      iconSize: 28,
                                      iconData: TmIcons.profile,
                                      color: context.colors.iconColor,
                                    ),
                                  ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              child: Text(
                                '${user?.firstName} ${user?.secondName}'
                                    .shortDisplayName(),
                                style: context.styles.textStyle.copyWith(
                                  color: context.colors.white,
                                ),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              'Id: ${user?.id.shortId()}',
                              style: context.styles.textStyle.copyWith(
                                color: context.colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TMAppBar(
                        backgroundColor: context.colors.transparent,
                        trailingPadding: const EdgeInsets.only(right: 17.5),
                        leadingPadding: const EdgeInsets.only(left: 17.5),
                        leading: Center(
                          child: TMIconButton(
                            iconData: TmIcons.logout,
                            color: context.colors.white,
                            onTap: () {
                              context.dependencies.authBloc.add(
                                const AuthEvent.signOut(),
                              );
                            },
                          ),
                        ),
                        trailing: ThemeSwitcher(
                          builder: (switcherContext) {
                            final isDark =
                                Theme.of(switcherContext).brightness ==
                                Brightness.dark;

                            return Builder(
                              builder: (buttonContext) {
                                return TMIconButton(
                                  iconData: isDark
                                      ? Icons.dark_mode_sharp
                                      : Icons.light_mode_sharp,
                                  color: context.colors.white,
                                  onTap: () async {
                                    final prefs =
                                        await SharedPreferences.getInstance();

                                    await prefs.setBool(
                                      'is_dark_theme',
                                      !isDark,
                                    );
                                    if (switcherContext.mounted) {
                                      ThemeSwitcher.of(
                                        switcherContext,
                                      ).changeTheme(
                                        theme: isDark
                                            ? AppThemeData.light
                                            : AppThemeData.dark,
                                        offset: Offset.zero,
                                      );
                                    }
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: HamburgerMenuItem.values.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Clickable(
                        onTap: HamburgerMenuItem.values[index].onTap(context),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.symmetric(
                              horizontal: BorderSide(
                                color: context.colors.iconDisable,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              HamburgerMenuItem.values[index].title(context),
                              style: context.styles.h1.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
  }
}
