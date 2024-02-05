part of 'custom_theme_bloc.dart';

abstract class CustomThemeEvent extends Equatable {
  const CustomThemeEvent();

  @override
  List<Object> get props => [];
}

class UpdateThemeEvent extends CustomThemeEvent {
  const UpdateThemeEvent(
    this.darkOrNight,
  );

  final bool darkOrNight;

  @override
  List<Object> get props => [darkOrNight];
}
