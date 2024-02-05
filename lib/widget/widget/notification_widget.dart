import 'package:bach_ngoc_sach_fake/router/app_navigation.dart';
import 'package:bach_ngoc_sach_fake/router/router_name.dart';
import 'package:bach_ngoc_sach_fake/service/account_bloc.dart';
import 'package:bach_ngoc_sach_fake/service/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
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
            title: !state.isLogin
                ? const Center(child: SizedBox())
                : const Text(
                    'Notification',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
          ),
          body: const Center(
            child: Text(
              'Notification',
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
