import 'package:bach_ngoc_sach_fake/model/follow.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  final String accountId;
  final String name;
  final String email;
  final String imgUser;
  final String phoneNumber;
  final String dateOfBirth;
  final String password;
  final List<Follow> follows;

  const Account({
    this.accountId = '',
    this.name = '',
    this.email = '',
    this.imgUser = '',
    this.phoneNumber = '',
    this.dateOfBirth = '',
    this.password = '',
    this.follows = const [],
  });

  Account copyWith(
      {final String? accountId,
      String? name,
      String? email,
      String? imgUser,
      String? phoneNumber,
      String? dateOfBirth,
      String? password,
      List<Follow>? follows}) {
    return Account(
      accountId: accountId ?? this.accountId,
      name: name ?? this.name,
      email: email ?? this.email,
      imgUser: imgUser ?? this.imgUser,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      password: password ?? this.password,
      follows: follows ?? this.follows,
    );
  }

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
