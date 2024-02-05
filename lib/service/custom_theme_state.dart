part of 'custom_theme_bloc.dart';

enum CustomThemeStatus { init, start, success, error }

class CustomThemeState extends Equatable {
  final bool darkOrNight;
  final CustomThemeStatus status;

  const CustomThemeState({this.darkOrNight = true, this.status = CustomThemeStatus.init});

  CustomThemeState copyWith({bool? darkOrNight, CustomThemeStatus? status}) {
    return CustomThemeState(
      darkOrNight: darkOrNight ?? this.darkOrNight,
      status: status ?? this.status
    );
  }

  factory CustomThemeState.fromJson(Map<String, dynamic> json) {
    return CustomThemeState(
      darkOrNight: json['darkOrNight'] as bool,
      status: CustomThemeStatus.values.firstWhere(
            (element) => element.name.toString() == json['status'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'darkOrNight': darkOrNight,
      'status': status.name,
    };
  }

  @override
  List<Object?> get props => [darkOrNight, status];
}


