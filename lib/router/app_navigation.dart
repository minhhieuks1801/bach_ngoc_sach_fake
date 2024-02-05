
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppNavigation {
  popUntil(context, page) {
    final router = GoRouter.of(context);
    final GoRouterDelegate delegate = router.routerDelegate;
    final routes = delegate.currentConfiguration.routes.reversed.toList();
    for (var i = 0; i < routes.length; i++) {
      final route = routes[i] as GoRoute;
      if (route.path == page) return;
      GoRouter.of(context).pop();
    }
  }

  pushName(context, {required String name, Map<String, dynamic>? extra}) {
    if (extra != null) {
      return GoRouter.of(context).pushNamed(name, extra: extra);
    }
    return GoRouter.of(context).pushNamed(name);
  }

  pushReplacementNamed(context, String name,
      {
        Map<String, String> pathParameters = const <String, String>{},
        Map<String, dynamic> queryParameters = const <String, dynamic>{},
        Object? extra,
      }) {
    GoRouter.of(context).pushReplacementNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
}
