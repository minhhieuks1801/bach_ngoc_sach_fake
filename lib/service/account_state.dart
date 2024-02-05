part of 'account_bloc.dart';

enum AccountStatus { init, start, success, error }

class AccountState extends Equatable {
  final Account account;
  final AccountStatus status;
  final bool isLogin;

  const AccountState(
      {this.account = const Account(), this.isLogin = false, this.status = AccountStatus.init});

  AccountState copyWith({Account? account, bool? isLogin, AccountStatus? status}) {
    return AccountState(
      account: account ?? this.account,
      isLogin: isLogin ?? this.isLogin,
      status: status ?? this.status,
    );
  }

  factory AccountState.fromJson(Map<String, dynamic> json) {
    return AccountState(
      account: Account.fromJson(json['account']),
      isLogin: json['isLogin'] as bool,
      status: AccountStatus.values.firstWhere(
        (element) => element.name.toString() == json['status'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'account': account.toJson(),
      'status': status.name,
      'isLogin': isLogin,
    };
  }

  @override
  List<Object?> get props => [account, isLogin, status];
}
