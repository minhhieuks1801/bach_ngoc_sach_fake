import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'custom_theme_event.dart';

part 'custom_theme_state.dart';

class CustomThemeBloc extends HydratedBloc<CustomThemeEvent, CustomThemeState> {
  CustomThemeBloc()
      : super(const CustomThemeState(status: CustomThemeStatus.start, darkOrNight: true)) {
    on<CustomThemeEvent>((event, emit) {
      if (event is UpdateThemeEvent) {
        update(event, emit);
      }
    });
  }

  @override
  CustomThemeState? fromJson(Map<String, dynamic> json) {
    return CustomThemeState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(CustomThemeState state) {
    return state.toJson();
  }

  Future<void> update(UpdateThemeEvent event, Emitter<CustomThemeState> emit) async {
    emit(state.copyWith(status: CustomThemeStatus.init));
    try{
      emit(state.copyWith(darkOrNight: event.darkOrNight, status: CustomThemeStatus.success));
    }catch(e){
      emit(state.copyWith(status: CustomThemeStatus.error));
    }
  }
}
