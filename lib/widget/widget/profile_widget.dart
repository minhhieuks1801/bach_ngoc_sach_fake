import 'package:bach_ngoc_sach_fake/font/language.dart';
import 'package:bach_ngoc_sach_fake/service/account_bloc.dart';
import 'package:bach_ngoc_sach_fake/service/custom_theme_bloc.dart';
import 'package:bach_ngoc_sach_fake/widget/widget/profile_no_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomThemeBloc, CustomThemeState>(
      builder: (context, customThemeState) {
        return BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            Language language = Language(check: customThemeState.darkOrNight);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: language.colorBackgroundPopupMenuItem,
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 18,
                    color: language.colorHome
                  ),
                ),
              ),
              body: !state.isLogin ? const ProfileNoLoginWidget() : const Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 38,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
