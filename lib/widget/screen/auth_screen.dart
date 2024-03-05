
import 'package:bach_ngoc_sach_fake/router/app_navigation.dart';
import 'package:bach_ngoc_sach_fake/router/router_name.dart';
import 'package:bach_ngoc_sach_fake/service/account_bloc.dart';
import 'package:bach_ngoc_sach_fake/service/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

GoRoute authScreenRouter = GoRoute(
  name: RouterName.authScreen,
  path: '/AuthScreen',
  builder: (BuildContext context, GoRouterState state) {
    return const AuthScreen();
  },
);

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}
class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        Future.delayed(const Duration(milliseconds: 50), () {
          dI<AppNavigation>().pushReplacementNamed(
            context,
            RouterName.bottomNavigatorScreen,
          );
        });
        return const Scaffold(
          body: Center(
            child: SizedBox(),
          ),
        );
      },
    );
  }
}
