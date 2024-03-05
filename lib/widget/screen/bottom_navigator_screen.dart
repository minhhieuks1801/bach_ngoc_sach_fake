import 'package:bach_ngoc_sach_fake/font/language.dart';
import 'package:bach_ngoc_sach_fake/router/router_name.dart';
import 'package:bach_ngoc_sach_fake/service/custom_theme_bloc.dart';
import 'package:bach_ngoc_sach_fake/widget/widget/follow_widget.dart';
import 'package:bach_ngoc_sach_fake/widget/widget/home_widget.dart';
import 'package:bach_ngoc_sach_fake/widget/widget/notification_widget.dart';
import 'package:bach_ngoc_sach_fake/widget/widget/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

GoRoute bottomNavigatorScreenRouter = GoRoute(
  name: RouterName.bottomNavigatorScreen,
  path: '/BottomNavigatorScreen',
  builder: (BuildContext context, GoRouterState state) {
    return const BottomNavigatorScreen(
    );
  },
);

class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({super.key});

  @override
  State<BottomNavigatorScreen> createState() => BottomNavigatorState();
}

class BottomNavigatorState extends State<BottomNavigatorScreen> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  late final List<Widget> _widgetOptions = <Widget>[
    const HomeWidget(),
    const FollowWidget(),
    const NotificationWidget(),
    const ProfileWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomThemeBloc, CustomThemeState>(
      builder: (context, customThemeState) {
        Language language = Language(check: customThemeState.darkOrNight);
        return Scaffold(
          body: SizedBox(
            height: MediaQuery
                .sizeOf(context)
                .height,
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            //showUnselectedLabels: true,
            selectedFontSize: 14,
            unselectedFontSize: 12,
            //type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.home, size: 32),
                label: 'Trang chủ',
                backgroundColor: language.colorBackground
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.collections_bookmark, size: 32),
                label: 'Tủ truyện',
                  backgroundColor: language.colorBackground
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.notifications, size: 32),
                label: 'Thông báo',
                  backgroundColor: language.colorBackground
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.account_circle, size: 32),
                label: 'Tài khoản',
                  backgroundColor: language.colorBackground
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xff128c7f),
            unselectedItemColor: const Color(0xff128c7f),
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }
}
