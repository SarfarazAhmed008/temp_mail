class Message{
  Message({
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
  });

  String? id;
  String? accountId;
  String? msgid;
  MessageUser? from;
  List<MessageUser>? to;
  String? subject;
  String? intro;
  bool? seen;
  bool? isDeleted;
  bool? hasAttachments;
  int? size;
  String? downloadUrl;
  String? createdAt;
  String? updatedAt;
}

class MessageUser {
  MessageUser({
    this.address,
    this.name
  });

  String? address;
  String? name;
}

