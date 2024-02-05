import 'package:bach_ngoc_sach_fake/router/router_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRoute loginScreenRouter = GoRoute(
  name: RouterName.loginScreen,
  path: '/LoginScreen',
  builder: (BuildContext context, GoRouterState state) {
    return const LoginScreen();
  },
);

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
