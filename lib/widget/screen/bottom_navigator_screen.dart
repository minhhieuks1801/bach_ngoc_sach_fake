
import 'package:bach_ngoc_sach_fake/router/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    const HomeScreen(),
    const MyCoursesScreen(),
    const BlogScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.vector, size: 32),
            label: 'Home',
            activeIcon: Icon(MyFlutterApp.homeIconSelect, size: 32),
          ),
          const BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.antDesignPlayCircleOutlined, size: 32),
            label: 'My Courses',
            activeIcon: Icon(MyFlutterApp.myCouresIconSelect, size: 32),
          ),
          const BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.bookCustomIcon, size: 32),
            label: 'Blogs',
            activeIcon: Icon(MyFlutterApp.blogIconSelect, size: 32),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle_outlined, size: 32),
            label: 'My Profile',
            activeIcon: SvgPicture.asset('assets/icons/profile_icon_select.svg',
                height: 32, width: 32),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff1E0094),
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
