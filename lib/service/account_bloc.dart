import 'dart:async';
import 'dart:convert';

import 'package:bach_ngoc_sach_fake/model/account.dart';
import 'package:bach_ngoc_sach_fake/model/follow.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:http/http.dart' as http;

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends HydratedBloc<AccountEvent, AccountState> {
  AccountBloc() : super(const AccountState(account: Account(), isLogin: false, status: AccountStatus.start)) {
    on<AccountEvent>((event, emit) {
      if(event is LoginEvent) {
        login(event, emit);
      }
      if(event is SignUpEvent) {
        signUp(event, emit);
      }
      if(event is LogoutEvent) {
        logout(event, emit);
      }
      if(event is FollowChapterEvent) {
        followChapterEvent(event, emit);
      }
      if(event is SettingAccountEvent) {
        settingAccount(event, emit);
      }
    });
  }

  @override
  AccountState? fromJson(Map<String, dynamic> json) {
    return AccountState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AccountState state) {
    return state.toJson();
  }

  Future<void> login(LoginEvent event, Emitter<AccountState> emit) async {
    try {
      String key = '';
      final response = await http
          .get(Uri.parse('https://ghichu-90657-default-rtdb.firebaseio.com/Account.json'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Account> accounts = await Future.wait(
          data.entries.map(
                (entry) async {
              if (entry.value['email'] == event.email && entry.value['password'] == event.pass) {
                key = entry.key;
                return Account(
                  accountId: entry.key,
                  name: entry.value['name'],
                  email: entry.value['email'],
                  password: entry.value['password'],
                  phoneNumber: entry.value['phoneNumber'],
                  dateOfBirth: entry.value['dateOfBirth'],
                  imgUser: entry.value['imgUser'],
                  follows: await getFlollows(entry.key),
                );
              } else {
                return const Account();
              }
            },
          ),
        );
        accounts.removeWhere((account) => account == const Account());
        accounts.isNotEmpty
            ? emit(state.copyWith(
            account: accounts.first, isLogin: true, status: AccountStatus.success))
            : emit(state.copyWith(isLogin: false, status: AccountStatus.error));
        updateUserData(
          '$key/userId',
          key,
        );
      } else {
        emit(state.copyWith(isLogin: false, status: AccountStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(isLogin: false, status: AccountStatus.error));
    }
  }

  Future<void> signUp(SignUpEvent event, Emitter<AccountState> emit) async {
  }

  Future<void> logout(LogoutEvent event, Emitter<AccountState> emit) async {
  }

  Future<void> followChapterEvent(FollowChapterEvent event, Emitter<AccountState> emit) async {
  }

  Future<void> settingAccount(SettingAccountEvent event, Emitter<AccountState> emit) async {
  }

  getFlollows(String key) async {}

  void updateUserData(String s, String key) async {}

}
