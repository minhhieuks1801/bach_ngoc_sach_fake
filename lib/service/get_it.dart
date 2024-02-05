
import 'package:bach_ngoc_sach_fake/router/app_navigation.dart';
import 'package:bach_ngoc_sach_fake/service/account_bloc.dart';

import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async{
  getIt.registerLazySingleton<AccountBloc>(() => AccountBloc());
  getIt.registerSingleton<AppNavigation>(AppNavigation());
}