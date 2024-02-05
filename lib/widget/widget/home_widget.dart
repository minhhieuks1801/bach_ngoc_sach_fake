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
        return Scaffold(
          backgroundColor:
              customThemeState.darkOrNight ? const Color(0xff424242) : const Color(0xffffffff),
          appBar: AppBar(
            backgroundColor:
                customThemeState.darkOrNight ? const Color(0xff424242) : const Color(0xffffffff),
            title: const Text(
              'Hello .....!',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            actions: [
              PopupMenuButton(
                color: customThemeState.darkOrNight
                    ? const Color(0xff424242)
                    : const Color(0xffffffff),
                icon: Icon(
                  Icons.menu,
                  color: customThemeState.darkOrNight
                      ? const Color(0xffffffff)
                      : const Color(0xff424242),
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
                          color: customThemeState.darkOrNight
                              ? const Color(0xff424242)
                              : const Color(0xffffffff),
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
                                  color: customThemeState.darkOrNight
                                      ? const Color(0xffffffff)
                                      : const Color(0xff000000),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.navigate_next,
                                color: customThemeState.darkOrNight
                                    ? const Color(0xffffffff)
                                    : const Color(0xff000000),
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
          body: const Center(
            child: Text(
              'Home',
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
