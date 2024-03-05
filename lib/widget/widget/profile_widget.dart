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
              backgroundColor: language.colorBackground,
              appBar: AppBar(
                backgroundColor: language.colorBackground,
                title: Text(
                  'Profile',
                  style: TextStyle(fontSize: 18, color: language.colorTxtHome),
                ),
                actions: [
                  PopupMenuButton(
                    color: language.colorBackground,
                    icon: Icon(
                      Icons.menu,
                      color: language.colorTxtHome,
                    ),
                    itemBuilder: (_) => [
                      PopupMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            dI<CustomThemeBloc>()
                                .add(UpdateThemeEvent(!customThemeState.darkOrNight));
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: language.colorBackground,
                            ),
                            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
                            padding:
                                const EdgeInsets.only(left: 15, bottom: 10, right: 10, top: 10),
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
              body: !state.isLogin
                  ? const ProfileNoLoginWidget()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 28, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: CircleAvatar(
                                  radius: 100,
                                  backgroundImage: NetworkImage(
                                    state.account.imgUser.toString(),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.account.name.toString(),
                                    textAlign: TextAlign.left,
                                    style:
                                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold,  color: language.colorTxtHome),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    state.account.email.toString(),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 28),
                                child: Row(children: [
                                  const Icon(Icons.accessibility, size: 32, color: Color(0xFF1E0094)),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Setting Account',
                                    style: TextStyle(fontSize: 18,  color: language.colorTxtHome),
                                  )
                                ]),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 28),
                                child: const Row(children: [
                                  Icon(Icons.link, size: 32, color: Color(0xFF1E0094)),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text('Connected Accounts', style: TextStyle(fontSize: 18))
                                ]),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 28),
                                child: const Row(
                                  children: [
                                    Icon(Icons.star_border, size: 32, color: Color(0xFF1E0094)),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text('Rate App', style: TextStyle(fontSize: 18))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 28),
                                child: const Row(
                                  children: [
                                    Icon(Icons.star_border, size: 32, color: Color(0xFF1E0094)),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Share app',
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 28),
                                child: const Row(children: [
                                  Icon(Icons.star_border, size: 32, color: Color(0xFF1E0094)),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text('Privacy Policy', style: TextStyle(fontSize: 18))
                                ]),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 28),
                                child: const Row(
                                  children: [
                                    Icon(Icons.star_border, size: 32, color: Color(0xFF1E0094)),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text('Sign Out', style: TextStyle(fontSize: 18))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            );
          },
        );
      },
    );
  }
}
