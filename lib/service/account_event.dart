part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends AccountEvent {
  const SignUpEvent(this.email, this.pass);

  final String email, pass;

  @override
  List<Object> get props => [email, pass];
}

class LoginEvent extends AccountEvent {
  const LoginEvent(this.email, this.pass);

  final String email;
  final String pass;

  @override
  List<Object> get props => [email, pass];
}

class LogoutEvent extends AccountEvent {}

class FollowChapterEvent extends AccountEvent {
  const FollowChapterEvent(this.account, this.follows, this.idNovel, this.idChapter);

  final Account account;
  final List<Follow> follows;
  final String idNovel;
  final String idChapter;

  @override
  List<Object> get props => [account];
}

class LoginAPIEvent extends AccountEvent {
  const LoginAPIEvent(this.email, this.pass);

  final String email;
  final String pass;

  @override
  List<Object> get props => [email, pass];
}

class SettingAccountEvent extends AccountEvent {
  const SettingAccountEvent(this.email, this.name, this.phone, this.account);

  final String email, name, phone;
  final Account account;

  @override
  List<Object> get props => [email, name, phone, account];
}

