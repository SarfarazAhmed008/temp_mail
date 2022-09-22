class Account {
  Account({
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
  });

  String? id;
  String? address;
  int? quota;
  int? used;
  bool? isDisabled;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;

  String? errorTitle;
  String? errorDesc;

}
