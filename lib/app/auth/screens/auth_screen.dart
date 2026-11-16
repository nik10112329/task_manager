import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_side_effect/flutter_bloc_side_effect.dart';
import 'package:task_manager/app/auth/bloc/auth_bloc.dart';
import 'package:task_manager/app/extensions/context.dart';
import 'package:task_manager/app/localization/generated/l10n.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/values/tm_icons.dart';
import 'package:task_manager/app/widgets/shaders/shader_mask_widget.dart';
import 'package:task_manager/app/widgets/text_fields/text_field.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final double _verticalSpace = 24;
  bool isStandardAuthMethods = true;

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: context.dependencies.authBloc,
      listener: (context, state) {
        state.mapOrNull(
          authed: (state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Signed in successfully ${state.user?.signInMethod}!',
                ),
              ),
            );
          },
          error: (state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.errorMessage}')),
            );
          },
        );
      },
      builder: (context, state) {
        final bloc = context.dependencies.authBloc;
        final isLoading = state.isLoading;

        return Scaffold(
          backgroundColor: context.colors.background,
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShaderMaskWidget(
                      shaderFile: 'shaders/gradient_flow.frag',
                      child: Text(
                        S.of(context).task_manager,
                        style: context.styles.h1.copyWith(
                          color: context.colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    SizedBox(height: _verticalSpace),
                    SizedBox(
                      height: 60,
                      child: TMTextField(
                        controller: loginController,
                        label: S.of(context).login,
                      ),
                    ),
                    SizedBox(height: _verticalSpace),
                    SizedBox(
                      height: 60,
                      child: TMTextField(
                        controller: passwordController,
                        label: S.of(context).password,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Clickable(
                        onTap: () {},
                        child: Text(
                          S.of(context).forgot_password,
                          style: context.styles.textStyle.copyWith(
                            color: context.colors.primary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: _verticalSpace),
                    Clickable(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 15,
                        ),
                        width: MediaQuery.sizeOf(context).width,
                        height: 60,
                        decoration: BoxDecoration(
                          color: context.colors.primary,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                          child: Text(
                            S.of(context).log_in,
                            style: context.styles.h1.copyWith(
                              color: context.colors.white,
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: _verticalSpace * 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: (MediaQuery.sizeOf(context).width - 50) / 4,
                          child: Divider(color: context.colors.primary),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          S.of(context).or_continue_with,
                          style: context.styles.textStyle.copyWith(
                            color: context.colors.primary,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: (MediaQuery.sizeOf(context).width - 50) / 4,
                          child: Divider(color: context.colors.primary),
                        ),
                      ],
                    ),
                    SizedBox(height: _verticalSpace),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(
                          children: [
                            ShaderMaskWidget(
                              shaderFile: 'shaders/gas_rainbow.frag',
                              child: SizedBox(
                                width:
                                    (MediaQuery.sizeOf(context).width - 60) / 2,
                                height: 60,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: context.colors.white,
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: context.colors.primary,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Clickable(
                              onTap: () {
                                if (!bloc.state.isLoading) {
                                  bloc.add(const AuthEvent.signInWithGoogle());
                                }
                              },
                              child: SizedBox(
                                width:
                                    (MediaQuery.sizeOf(context).width - 60) / 2,
                                height: 60,
                                child: Center(
                                  child: Icon(
                                    TmIcons.googlePlus,
                                    color: context.colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Clickable(
                          onTap: () {
                            if (!bloc.state.isLoading) {
                              bloc.add(const AuthEvent.signInWithVk());
                            }
                          },
                          child: Stack(
                            children: [
                              ShaderMaskWidget(
                                shaderFile: 'shaders/vk_background.frag',
                                child: SizedBox(
                                  width:
                                      (MediaQuery.sizeOf(context).width - 60) /
                                      2,
                                  height: 60,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: context.colors.accent,
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        color: context.colors.white,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    (MediaQuery.sizeOf(context).width - 60) / 2,
                                height: 60,
                                child: Center(
                                  child: Icon(
                                    TmIcons.vk,
                                    color: context.colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: _verticalSpace),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Clickable(
                          onTap: () {},
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: context.colors.secondary,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: context.colors.primary,
                                width: 2,
                              ),
                            ),
                            child: SizedBox(
                              width:
                                  (MediaQuery.sizeOf(context).width - 60) / 2,
                              height: 60,
                              child: ShaderMaskWidget(
                                shaderFile: 'shaders/gas_rainbow.frag',
                                child: Center(
                                  child: Text(
                                    'Google Oauth',
                                    style: context.styles.textStyle.copyWith(
                                      color: context.colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Clickable(
                              onTap: () {
                                if (!bloc.state.isLoading) {
                                  bloc.add(
                                    const AuthEvent.signInWithGitHubOauth(),
                                  );
                                }
                              },
                              child: SizedBox(
                                width:
                                    (MediaQuery.sizeOf(context).width - 60) / 2,
                                height: 60,
                                child: ShaderMaskWidget(
                                  shaderFile: 'shaders/gradient_flow.frag',
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: context.colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width:
                                  (MediaQuery.sizeOf(context).width - 60) / 2,
                              height: 60,
                              child: Center(
                                child: Icon(
                                  TmIcons.github,
                                  size: 40,
                                  color: context.colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: _verticalSpace * 2),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: S.of(context).new_user,
                            style: context.styles.textStyle.copyWith(
                              color: context.colors.textColor,
                            ),
                          ),
                          const WidgetSpan(child: SizedBox(width: 5)),
                          TextSpan(
                            text: S.of(context).sign_up,
                            style: context.styles.textStyle.copyWith(
                              color: context.colors.primary,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {}, // Оставляем как есть для sign up
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (isLoading) const Center(child: CircularProgressIndicator()),
            ],
          ),
        );
      },
    );
  }
}
