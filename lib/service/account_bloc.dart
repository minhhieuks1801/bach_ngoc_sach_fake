import 'dart:async';
import 'dart:convert';

import 'package:bach_ngoc_sach_fake/model/account.dart';
import 'package:bach_ngoc_sach_fake/model/follow.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

part 'account_event.dart';

part 'account_state.dart';

class AccountBloc extends HydratedBloc<AccountEvent, AccountState> {
  AccountBloc()
      : super(const AccountState(account: Account(), isLogin: false, status: AccountStatus.start)) {
    on<AccountEvent>((event, emit){});
    on<LoginEvent>(login);
    on<SignUpEvent>(signUp);
    on<LogoutEvent>(logout);
    on<FollowChapterEvent>(followChapterEvent);
    on<SettingAccountEvent>(settingAccount);
  }

  final Logger logger = Logger('Erro');

  @override
  AccountState? fromJson(Map<String, dynamic> json) {
    return AccountState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AccountState state) {
    return state.toJson();
  }

  Future<void> login(LoginEvent event, Emitter<AccountState> emit) async {
    emit(state.copyWith(isLogin: false, status: AccountStatus.start));
    try {
      final response = await http
          .get(Uri.parse('https://shopsach-1adc5-default-rtdb.firebaseio.com/Account.json'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Account> accounts = data.entries.map((entry) =>
          Account(
            accountId: entry.key,
            name: entry.value['name'],
            email: entry.value['email'],
            password: entry.value['password'],
            phoneNumber: entry.value['phoneNumber'],
            dateOfBirth: entry.value['dateOfBirth'],
            imgUser: entry.value['imgUser'],
            follows: getFollows(entry.key),
          )
        ).toList();
        print('llll');
        Account? account =
            accounts.where((a) => a.email == event.email && a.password == event.pass).firstOrNull;
        account != null
            ? emit(state.copyWith(account: account, isLogin: true, status: AccountStatus.success))
            : emit(state.copyWith(isLogin: false, status: AccountStatus.error));
      } else {
        emit(state.copyWith(isLogin: false, status: AccountStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(isLogin: false, status: AccountStatus.error));
    }
  }

  Future<void> signUp(SignUpEvent event, Emitter<AccountState> emit) async {}

  Future<void> logout(LogoutEvent event, Emitter<AccountState> emit) async {}

  Future<void> followChapterEvent(FollowChapterEvent event, Emitter<AccountState> emit) async {}

  Future<void> settingAccount(SettingAccountEvent event, Emitter<AccountState> emit) async {}

  getFollows(String key) async {
    try {
      final response = await http.get(
          Uri.parse('https://shopsach-1adc5-default-rtdb.firebaseio.com/Account$key/follow.json'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Follow> myCourses = data.entries
            .map(
              (entry) => Follow(
                idChapter: entry.key,
                idNovel: entry.value['idNovel'],
              ),
            )
            .toList();
        return myCourses;
      } else {
        logger.warning('Error fetching courses: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      logger.severe('Error fetching courses: $e', e);
      return [];
    }
  }

  void updateUserData(String key, dynamic data) async {
    final response = await http.put(
      Uri.parse('https://education-a9946-default-rtdb.firebaseio.com/Account/$key.json'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      logger.warning("Success: ${response.body}");
    } else {
      logger.warning("Error: ${response.statusCode}");
    }
  }
}
