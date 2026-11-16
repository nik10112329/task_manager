import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/app/auth/bloc/auth_bloc.dart';
import 'package:task_manager/app/extensions/context.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/values/assets.gen.dart';
import 'package:task_manager/app/values/tm_icons.dart';
import 'package:task_manager/app/widgets/app_bar/app_bar.dart';
import 'package:task_manager/app/widgets/icon_button.dart';
import 'package:task_manager/features/profile/view/utils/profile_utils.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ProfileUtils.profileData(
      context.dependencies.authBloc.state.user,
    );
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 300,
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
                          Text(
                            '${user?.firstName} ${user?.secondName}',
                            style: context.styles.textStyle.copyWith(
                              color: context.colors.white,
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
                          iconData: TmIcons.leftArrow,
                          color: context.colors.white,
                          onTap: () {
                            context.pop();
                          },
                          iconSize: 35,
                        ),
                      ),
                      trailing: Center(
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
                    ),
                  ],
                ),
              ),
              Expanded(child: Container(color: context.colors.secondary)),
            ],
          ),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: context.colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: context.colors.background.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: const ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(24),
                  child: Column(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
