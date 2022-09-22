import '../../domain/entities/message_collection.dart';
import 'message_model.dart';

class MessageCollectionModel extends MessageCollection{
  MessageCollectionModel({
    this.messageModelList,
    this.totalItems,
  }) : super(messageModelList: messageModelList, totalItems: totalItems);

  final List<MessageModel>? messageModelList;
  final int? totalItems;

  factory MessageCollectionModel.fromJson(Map<String, dynamic> json) => MessageCollectionModel(
    messageModelList: json['hydra:member'] != null ? List<MessageModel>.from(json["hydra:member"].map((x) => MessageModel.fromJson(x))) : null,
    totalItems: json["hydra:totalItems"]
  );
}
