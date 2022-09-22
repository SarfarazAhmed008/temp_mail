import '../../domain/entities/domain_collection.dart';
import 'domain_model.dart';

class DomainCollectionModel extends DomainCollection{
  DomainCollectionModel({
    this.domainModelList,
    this.totalItems,
  }) : super(domainModelList: domainModelList, totalItems: totalItems);

  final List<DomainModel>? domainModelList;
  final int? totalItems;

  factory DomainCollectionModel.fromJson(Map<String, dynamic> json) => DomainCollectionModel(
    domainModelList: json['hydra:member'] != null ? List<DomainModel>.from(json["hydra:member"].map((x) => DomainModel.fromJson(x))) : null,
    totalItems: json["hydra:totalItems"]
  );
}
