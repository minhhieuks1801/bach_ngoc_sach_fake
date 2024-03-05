import 'dart:ui';

class Language {
  Color colorBackground = const Color(0xffffffff);
  Color colorTxtHome = const Color(0xff000000);
  Color colorButtonBackground = const Color(0xff000000);
  Color colorButtonLable = const Color(0xff000000);
  Color colorProfile = const Color(0xff000000);

  Language({bool check = true}) {
    colorProfile = check
        ? const Color(0xff575757)
        : const Color(0xffffffff);
    colorTxtHome = check
        ? const Color(0xffffffff)
        : const Color(0xff000000);
    colorBackground = check
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
