import '../../domain/entities/domain.dart';

class DomainModel extends Domain{
  DomainModel({
    this.id,
    this.domain,
    this.isActive,
    this.isPrivate,
    this.createdAt,
    this.updatedAt
  }) : super (
    id: id,
    domain: domain,
    isActive: isActive,
    isPrivate: isPrivate,
    createdAt: createdAt,
    updatedAt: updatedAt
  );

  final String? id;
  final String? domain;
  final bool? isActive;
  final bool? isPrivate;
  final String? createdAt;
  final String? updatedAt;

  factory DomainModel.fromJson(Map<String, dynamic> json) => DomainModel(
    id: json["id"],
    domain: json["domain"],
    isActive: json["isActive"],
    isPrivate: json["isPrivate"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );
}
