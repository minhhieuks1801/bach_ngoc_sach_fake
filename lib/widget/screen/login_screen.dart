import 'package:bach_ngoc_sach_fake/font/language.dart';
import 'package:bach_ngoc_sach_fake/router/router_name.dart';
import 'package:bach_ngoc_sach_fake/service/account_bloc.dart';
import 'package:bach_ngoc_sach_fake/service/custom_theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPassWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomThemeBloc, CustomThemeState>(
      builder: (context, customThemeState) {
        return BlocBuilder<AccountBloc, AccountState>(
          builder: (context, accountState) {
            Language language = Language(check: customThemeState.darkOrNight);
            return Scaffold(
                backgroundColor: language.colorBackgroundPopupMenuItem,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                        child: Image.asset('assets/images/logo2.png',
                            width: 150, height: 30, fit: BoxFit.fill)),
                    Container(
                      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 30, top: 30),
                      child: TextField(
                        controller: txtEmail,
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 30),
                      child: TextField(
                        controller: txtPassWord,
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xff128c7f),
                        ),
                        child: const Text('Đăng nhập',
                            style: TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.only(right: 25, left: 20, bottom: 20, top: 20),
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: language.colorButtonBackground,
                              ),
                              child: Text(
                                'Đăng ký',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: language.colorButtonLable,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.only(right: 25, left: 20, bottom: 20, top: 20),
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: language.colorButtonBackground,
                              ),
                              child: Text(
                                'Quên mật khẩu',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: language.colorButtonLable,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ));
          },
        );
      },
    );
  }
}
