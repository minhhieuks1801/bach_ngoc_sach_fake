import 'package:bach_ngoc_sach_fake/font/language.dart';
import 'package:bach_ngoc_sach_fake/service/account_bloc.dart';
import 'package:bach_ngoc_sach_fake/service/custom_theme_bloc.dart';
import 'package:bach_ngoc_sach_fake/service/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomThemeBloc, CustomThemeState>(
      builder: (context, customThemeState) {
        Language language = Language(check: customThemeState.darkOrNight);
        return BlocBuilder<AccountBloc, AccountState>(
          builder: (context, accountState) {
            return Scaffold(
              backgroundColor: language.colorBackground,
              appBar: AppBar(
                backgroundColor: language.colorBackground,
                title: Text(
                  'Hello ${accountState.account.name}!',
                  style: TextStyle(
                    fontSize: 18,
                    color: language.colorTxtHome,
                  ),
                ),
                actions: [
                  PopupMenuButton(
                    color: language.colorBackground,
                    icon: Icon(
                      Icons.menu,
                      color: language.colorTxtHome,
                    ),
                    itemBuilder: (_) =>
                    [
                      PopupMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            dI<CustomThemeBloc>().add(
                                UpdateThemeEvent(!customThemeState.darkOrNight));
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: language.colorBackground,
                            ),
                            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
                            padding: const EdgeInsets.only(
                                left: 15, bottom: 10, right: 10, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: Text(
                                    'Ngày / Đêm',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: language.colorTxtHome,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.navigate_next,
                                    color: language.colorTxtHome,
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
              body: Center(
                child: Text(
                  'home',
                  style: TextStyle(
                    fontSize: 38,
                    color: language.colorTxtHome,
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
