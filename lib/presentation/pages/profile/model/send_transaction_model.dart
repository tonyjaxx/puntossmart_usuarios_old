class SendTransactionModel {
  String? message;
  int? totalTransactions;
  List<Transactions>? transactions;

  SendTransactionModel(
      {this.message, this.totalTransactions, this.transactions});

  SendTransactionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    totalTransactions = json['Total Transactions'];
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['Total Transactions'] = this.totalTransactions;
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transactions {
  int? id;
  String? uuid;
  String? walletUuid;
  String? transactionId;
  String? type;
  int? price;
  String? note;
  String? status;
  int? createdBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? userFirstname;

  Transactions(
      {this.id,
      this.uuid,
      this.walletUuid,
      this.transactionId,
      this.type,
      this.price,
      this.note,
      this.status,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userFirstname});

  Transactions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    walletUuid = json['wallet_uuid'];
    transactionId = json['transaction_id'];
    type = json['type'];
    price = json['price'];
    note = json['note'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    userFirstname = json['user_firstname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['wallet_uuid'] = this.walletUuid;
    data['transaction_id'] = this.transactionId;
    data['type'] = this.type;
    data['price'] = this.price;
    data['note'] = this.note;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['user_firstname'] = this.userFirstname;
    return data;
  }
}
