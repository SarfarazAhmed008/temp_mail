import '../../domain/entities/account.dart';

class AccountModel extends Account{
  AccountModel({
    this.id,
    this.address,
    this.quota,
    this.used,
    this.isDisabled,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.errorTitle,
    this.errorDesc
  }) : super(
    id: id,
    address: address,
    quota: quota,
    used: used,
    isDisabled: isDisabled,
    isDeleted: isDeleted,
    createdAt: createdAt,
    updatedAt: updatedAt,
    errorTitle: errorTitle,
    errorDesc: errorDesc,
  );

  final String? id;
  final String? address;
  final int? quota;
  final int? used;
  final bool? isDisabled;
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;

  final String? errorTitle;
  final String? errorDesc;

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
    id: json["id"],
    address: json["address"],
    quota: json["quota"],
    used: json["used"],
    isDisabled: json["isDisabled"],
    isDeleted: json["isDeleted"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],

    errorTitle: json["title"],
    errorDesc: json["detail"],
  );
}
