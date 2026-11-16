import 'package:auto_route/auto_route.dart';
import 'package:task_manager/app/auth/bloc/auth_bloc.dart';
import 'package:task_manager/app/router/app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  const AuthGuard(this.authBloc);

  final AuthBloc authBloc;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isLoggedIn = authBloc.state.maybeWhen(
      authed: (_) => true,
      orElse: () => false,
    );

    if (isLoggedIn) {
      resolver.next();
    } else {
      router.pushAndPopUntil(const AuthRoute(), predicate: (route) => false);
      resolver.next(false);
    }
  }
}
