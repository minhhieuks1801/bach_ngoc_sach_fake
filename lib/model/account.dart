import 'package:bach_ngoc_sach_fake/model/follow.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  final String userId;
  final String name;
  final String email;
  final String imgUser;
  final String phoneNumber;
  final int rate;
  final bool connect;
  final String password;
  final List<Follow> follows;

  const Account(
      {this.userId = '',
      this.name = '',
      this.email = '',
      this.imgUser = '',
      this.phoneNumber = '',
      this.rate = 0,
      this.connect = false,
      this.password = '',
      this.follows = const []});

  Account copyWith(
      {final String? userId,
      String? name,
      String? email,
      String? imgUser,
      String? phoneNumber,
      int? rate,
      bool? connect,
      String? password,
      List<Follow>? follows}) {
    return Account(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      imgUser: imgUser ?? this.imgUser,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      rate: rate ?? this.rate,
      connect: connect ?? this.connect,
      password: password ?? this.password,
      follows: follows ?? this.follows,

    );
  }

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
