import 'dart:async';

import 'package:bach_ngoc_sach_fake/model/account.dart';
import 'package:bach_ngoc_sach_fake/model/follow.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends HydratedBloc<AccountEvent, AccountState> {
  AccountBloc() : super(const AccountState(account: Account(), isLogin: false, status: AccountStatus.start)) {
    on<AccountEvent>((event, emit) {
      on<LoginEvent>(login);
      on<SignUpEvent>(signUp);
      on<LogoutEvent>(logout);
      on<FollowChapterEvent>(followChapterEvent);
      on<LoginAPIEvent>(loginAPIEvent);
      on<SettingAccountEvent>(settingAccount);
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
  }

  Future<void> signUp(SignUpEvent event, Emitter<AccountState> emit) async {
  }

  Future<void> logout(LogoutEvent event, Emitter<AccountState> emit) async {
  }

  Future<void> followChapterEvent(FollowChapterEvent event, Emitter<AccountState> emit) async {
  }

  Future<void> loginAPIEvent(LoginAPIEvent event, Emitter<AccountState> emit) async {
  }

  Future<void> settingAccount(SettingAccountEvent event, Emitter<AccountState> emit) async {
  }
}
