import '../../domain/entities/message.dart';

class MessageModel extends Message{
  MessageModel({
    this.id,
    this.accountId,
    this.msgid,
    this.from,
    this.to,
    this.subject,
    this.intro,
    this.seen,
    this.isDeleted,
    this.hasAttachments,
    this.size,
    this.downloadUrl,
    this.createdAt,
    this.updatedAt
  }) : super(
    id: id,
    accountId: accountId,
    msgid: msgid,
    from: from,
    to: to,
    subject: subject,
    intro: intro,
    seen: seen,
    isDeleted: isDeleted,
    hasAttachments: hasAttachments,
    size: size,
    downloadUrl: downloadUrl,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  final String? id;
  final String? accountId;
  final String? msgid;
  final MessageUserModel? from;
  final List<MessageUserModel>? to;
  final String? subject;
  final String? intro;
  final bool? seen;
  final bool? isDeleted;
  final bool? hasAttachments;
  final int? size;
  final String? downloadUrl;
  final String? createdAt;
  final String? updatedAt;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    id: json["id"],
    accountId: json["accountId"],
    msgid: json["msgid"],
    from: json['from'] != null ? MessageUserModel.fromJson(json["from"]) : null,
    to: json['to'] != null ? List<MessageUserModel>.from(json["to"].map((x) => MessageUserModel.fromJson(x))) : null,
    subject: json["subject"],
    intro: json["intro"],
    seen: json["seen"],
    isDeleted: json["isDeleted"],
    hasAttachments: json["hasAttachments"],
    size: json["size"],
    downloadUrl: json["downloadUrl"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );
}

class MessageUserModel extends MessageUser {
  MessageUserModel({
    this.address,
    this.name
  });

  final String? address;
  final String? name;

  factory MessageUserModel.fromJson(Map<String, dynamic> json) => MessageUserModel(
    address: json["address"],
    name: json["name"],
  );
}

