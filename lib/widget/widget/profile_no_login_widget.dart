import 'package:bach_ngoc_sach_fake/router/app_navigation.dart';
import 'package:bach_ngoc_sach_fake/router/router_name.dart';
import 'package:bach_ngoc_sach_fake/service/injection.dart';
import 'package:flutter/material.dart';

class ProfileNoLoginWidget extends StatelessWidget {
  const ProfileNoLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              dI<AppNavigation>().pushName(
                context,
                name: RouterName.loginScreen,
              );
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xff424242),
              ),
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
              padding: const EdgeInsets.only(left: 15, bottom: 10, right: 10, top: 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.navigate_next,
                      color: Color(0xffffffff),
                      size: 24,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xff424242),
            ),
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
            padding: const EdgeInsets.only(left: 15, bottom: 10, right: 10, top: 10),
            child: const Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    'Hướng dẫn',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.navigate_next,
                    color: Color(0xffffffff),
                    size: 24,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xff424242),
            ),
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
            padding: const EdgeInsets.only(left: 15, bottom: 10, right: 10, top: 10),
            child: const Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    'Liên hệ, báo lỗi',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.navigate_next,
                    color: Color(0xffffffff),
                    size: 24,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}