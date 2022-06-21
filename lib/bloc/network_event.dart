import 'package:flutter/cupertino.dart';
import 'package:im/modals/business_model.dart';
import 'package:im/modals/item_model.dart';
import 'package:im/modals/party_model.dart';
import 'package:im/modals/transaction_model.dart';
import 'package:im/modals/user_model.dart';

@immutable
abstract class NetworkEvent{}

class GetAllBusinessEvent extends NetworkEvent{}

class GetAllTransactionEvent extends NetworkEvent{}

class GetAllPartyEvent extends NetworkEvent{}

class GetAllItemEvent extends NetworkEvent{}

class GetUserEvent extends NetworkEvent{}

class GetBusinessEvent extends NetworkEvent{
  GetBusinessEvent(this.businessId);

  final String businessId;
}

class GetPartyEvent extends NetworkEvent{
  GetPartyEvent(this.partyId);

  final String partyId;
}

class GetItemEvent extends NetworkEvent{
  GetItemEvent(this.itemId);

  final String itemId;
}

class GetTransactionEvent extends NetworkEvent{
  GetTransactionEvent(this.transactionId);

  final String transactionId;
}

class DeleteUserEvent extends NetworkEvent{}

class DeleteBusinessEvent extends NetworkEvent{
  DeleteBusinessEvent(this.businessId);

  final String businessId;
}

class DeletePartyEvent extends NetworkEvent{
  DeletePartyEvent(this.partyId);

  final String partyId;
}

class DeleteItemEvent extends NetworkEvent{
  DeleteItemEvent(this.itemId);

  final String itemId;
}

class DeleteTransactionEvent extends NetworkEvent{
  DeleteTransactionEvent(this.transactionId);

  final String transactionId;
}

class AddUserEvent extends NetworkEvent{
  AddUserEvent(this.user);

  final ModelUser user;
}

class AddBusinessEvent extends NetworkEvent{
  AddBusinessEvent(this.business);

  final ModelBusiness business;
}

class AddPartyEvent extends NetworkEvent{
  AddPartyEvent(this.party);

  final ModelParty party;
}

class AddItemEvent extends NetworkEvent{
  AddItemEvent(this.item);

  final ModelItem item;
}

class AddTransactionEvent extends NetworkEvent{
  AddTransactionEvent(this.transaction);

  final ModelTransaction transaction;
}

class UpdateUserEvent extends NetworkEvent{
  UpdateUserEvent(this.user);

  final ModelUser user;
}

class UpdateBusinessEvent extends NetworkEvent{
  UpdateBusinessEvent(this.business);

  final ModelBusiness business;
}

class UpdatePartyEvent extends NetworkEvent{
  UpdatePartyEvent(this.party);

  final ModelParty party;
}

class UpdateItemEvent extends NetworkEvent{
  UpdateItemEvent(this.item);

  final ModelItem item;
}

class UpdateTransactionEvent extends NetworkEvent{
  UpdateTransactionEvent(this.transaction);

  final ModelTransaction transaction;
}

