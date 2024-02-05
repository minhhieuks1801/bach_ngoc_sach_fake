import 'package:bach_ngoc_sach_fake/router/app_navigation.dart';
import 'package:bach_ngoc_sach_fake/router/router_name.dart';
import 'package:bach_ngoc_sach_fake/service/account_bloc.dart';
import 'package:bach_ngoc_sach_fake/service/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowWidget extends StatefulWidget {
  const FollowWidget({super.key});

  @override
  State<FollowWidget> createState() => _FollowWidgetState();
}

class _FollowWidgetState extends State<FollowWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (!state.isLogin) {
          Future.delayed(Duration.zero, () {
            dI<AppNavigation>().pushName(
              context,
              name: RouterName.loginScreen,
            );
          });
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Follow',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          body: !state.isLogin
              ? const Center(child: SizedBox())
              : const Center(
            child: Text(
              'Follow',
              style: TextStyle(
                fontSize: 38,
              ),
            ),
          ),
        );
      },
    );
  }
}
