import 'dart:ui';

class Language {
  Color colorBackgroundPopupMenuItem = const Color(0xffffffff);
  Color colorHome = const Color(0xff000000);
  Color colorButtonBackground = const Color(0xff000000);
  Color colorButtonLable = const Color(0xff000000);

  Language({bool check = true}) {
    colorHome = check
        ? const Color(0xffffffff)
        : const Color(0xff000000);
    colorBackgroundPopupMenuItem = check
        ? const Color(0xff424242)
        : const Color(0xffffffff);
    colorButtonBackground = check
        ? const Color(0xffffffff)
        : const Color(0xff424242);
    colorButtonLable = check
        ? const Color(0xff128c7f)
        : const Color(0xffffffff);
  }
}
