import 'package:bach_ngoc_sach_fake/font/language.dart';
import 'package:bach_ngoc_sach_fake/service/account_bloc.dart';
import 'package:bach_ngoc_sach_fake/service/custom_theme_bloc.dart';
import 'package:bach_ngoc_sach_fake/service/injection.dart';
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
                actions: [
                  PopupMenuButton(
                    color: language.colorBackgroundPopupMenuItem,
                    icon: Icon(
                      Icons.menu,
                      color: language.colorHome,
                    ),
                    itemBuilder: (_) => [
                      PopupMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            dI<CustomThemeBloc>().add(UpdateThemeEvent(!customThemeState.darkOrNight));
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: language.colorBackgroundPopupMenuItem,
                            ),
                            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
                            padding: const EdgeInsets.only(left: 15, bottom: 10, right: 10, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: Text(
                                    'Ngày / Đêm',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: language.colorHome,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.navigate_next,
                                    color: language.colorHome,
                                    size: 24,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
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
