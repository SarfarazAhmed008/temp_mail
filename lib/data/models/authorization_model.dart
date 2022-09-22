import '../../domain/entities/authorization.dart';

class AuthorizationModel extends Authorization{
  AuthorizationModel({
    this.id,
    this.token,
    this.errorMessage
  }) : super(
    id: id,
    token: token,
    errorMessage: errorMessage
  );

  String? id;
  String? token;

  String? errorMessage;

  factory AuthorizationModel.fromJson(Map<String, dynamic> json) => AuthorizationModel(
    id: json["id"],
    token: json["token"],

    errorMessage: json["message"],
  );
}
