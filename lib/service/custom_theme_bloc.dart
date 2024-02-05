import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'custom_theme_event.dart';
part 'custom_theme_state.dart';

class CustomThemeBloc extends Bloc<CustomThemeEvent, CustomThemeState> {
  CustomThemeBloc() : super(CustomThemeInitial()) {
    on<CustomThemeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
