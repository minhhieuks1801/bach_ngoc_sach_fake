
import 'package:bach_ngoc_sach_fake/router/router_name.dart';
import 'package:bach_ngoc_sach_fake/widget/screen/auth_screen.dart';
import 'package:bach_ngoc_sach_fake/widget/screen/bottom_navigator_screen.dart';
import 'package:bach_ngoc_sach_fake/widget/screen/login_screen.dart';
import 'package:go_router/go_router.dart';

class RouterCustom {
  final GoRouter goRouter;

  RouterCustom() : goRouter = _router;

  static GoRouter get _router =>
      GoRouter(routes: routerPages, initialLocation: RouterName.authScreen);

  static List<GoRoute> routerPages = {
    RouterName.bottomNavigatorScreen: bottomNavigatorScreenRouter,
    RouterName.authScreen: authScreenRouter,
    RouterName.loginScreen: loginScreenRouter,
  }.entries.map((entry) => entry.value).toList();
}
