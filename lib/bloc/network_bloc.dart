
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im/bloc/network_event.dart';
import 'package:im/bloc/network_state.dart';
import 'package:im/modals/item_model.dart';
import 'package:im/modals/party_model.dart';

import '../graphql/graphql_config.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  var phoneNumber = '+918056384773';

  NetworkBloc(NetworkState initialState) : super(initialState){
    on<AddUserEvent>(_addUser);
    on<AddTransactionEvent>(_addTransaction);
    on<AddBusinessEvent>(_addBusiness);
    on<AddPartyEvent>(_addParty);
    on<AddItemEvent>(_addItem);
    on<UpdateUserEvent>(_updateUser);
    on<UpdateTransactionEvent>(_updateTransaction);
    on<UpdateBusinessEvent>(_updateBusiness);
    on<UpdatePartyEvent>(_updateParty);
    on<UpdateItemEvent>(_updateItem);
    on<DeleteUserEvent>(_deleteUser);
    on<DeleteTransactionEvent>(_deleteTransaction);
    on<DeleteBusinessEvent>(_deleteBusiness);
    on<DeletePartyEvent>(_deleteParty);
    on<DeleteItemEvent>(_deleteItem);
    on<GetUserEvent>(_getUser);
    on<GetTransactionEvent>(_getTransaction);
    on<GetBusinessEvent>(_getBusiness);
    on<GetPartyEvent>(_getParty);
    on<GetItemEvent>(_getItem);
    on<GetAllTransactionEvent>(_getAllTransaction);
    on<GetAllBusinessEvent>(_getAllBusiness);
    on<GetAllPartyEvent>(_getAllParty);
    on<GetAllItemEvent>(_getAllItem);
  }


  void _addUser(AddUserEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      Map<String, dynamic>? message = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "add_user",
          event.user.toJson());
      emit(Success(message));
    }catch(_){
      emit(Failed());
    }
  }

  void _addTransaction(AddTransactionEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      var prop = {'phoneNumber':phoneNumber,'transaction':event.transaction.toJson()};
      Map<String, dynamic>? message = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "add_transaction",
          prop);
      emit(Success(message));
    }catch(_){
      emit(Failed());
    }
  }

  void _addBusiness(AddBusinessEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      var prop = {'phoneNumber':phoneNumber,'business':event.business.toJson()};
      Map<String, dynamic>? message = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "add_business",
          prop);
      emit(Success(message));
    }catch(_){
      emit(Failed());
    }
  }

  void _addParty(AddPartyEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      var prop = {'phoneNumber':phoneNumber,'party':event.party.toJson()};
      Map<String, dynamic>? message = await graphQlObject.getMutationValues(
          graphQlObject.graphQLClient,
          "add_party",
          prop);
      emit(Success(message));
    }catch(_){
      emit(Failed());
    }
  }

  void _addItem(AddItemEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      var prop = {'phoneNumber':phoneNumber,'item':event.item.toJson()};
      Map<String, dynamic>? message = await graphQlObject.getMutationValues(
          graphQlObject.graphQLClient,
          "add_item",
          prop);
      emit(Success(message));
    }catch(_){
      emit(Failed());
    }
  }

  void _updateUser(UpdateUserEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      Map<String, dynamic>? message = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "update_user",
          event.user.toJson());
      emit(Success(message));
    }catch(_){
      emit(Failed());
    }
  }

  void _updateTransaction(UpdateTransactionEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      Map<String, dynamic>? message = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "update_transaction",
          event.transaction.toJson());
      emit(Success(message));
    }catch(_){
      emit(Failed());
    }
  }

  void _updateBusiness(UpdateBusinessEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      Map<String, dynamic>? message = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "update_business",
          event.business.toJson());
      emit(Success(message));
    }catch(_){
      emit(Failed());
    }
  }

  void _updateParty(UpdatePartyEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      Map<String, dynamic>? message = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "update_party",
          event.party.toJson());
      emit(Success(message));
    }catch(_){
      emit(Failed());
    }
  }

  void _updateItem(UpdateItemEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      Map<String, dynamic>? message = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "update_item",
          event.item.toJson());
      emit(Success(message));
    }catch(_){
      emit(Failed());
    }
  }


  void _deleteUser(DeleteUserEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      var prop = {'phoneNumber':phoneNumber};
      Map<String, dynamic>? message = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "delete_user",
          prop
      );
      emit(Success(message));
    }catch(_){
      emit(Failed());
    }
  }

  void _deleteTransaction(DeleteTransactionEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      var prop = {'phoneNumber':phoneNumber,'transactionId':event.transactionId};
      Map<String, dynamic>? message = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "delete_transaction",
          prop
      );
      emit(Success(message));
    }catch(_){
      emit(Failed());
    }
  }

  void _deleteBusiness(DeleteBusinessEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      var prop = {'phoneNumber':phoneNumber,'businessId':event.businessId};
      Map<String, dynamic>? message = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "delete_business",
          prop
      );
      emit(Success(message));
    }catch(_){
      emit(Failed());
    }
  }

  void _deleteParty(DeletePartyEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      var prop = {'phoneNumber':phoneNumber,'partyId':event.partyId};
      Map<String, dynamic>? message = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "delete_party",
          prop
      );
      emit(Success(message));
    }catch(_){
      emit(Failed());
    }
  }

  void _deleteItem(DeleteItemEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      var prop = {'phoneNumber':phoneNumber,'itemId':event.itemId};
      Map<String, dynamic>? message = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "delete_item",
          prop
      );
      emit(Success(message));
    }catch(_){
      emit(Failed());
    }
  }

  void _getUser(GetUserEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      var prop = {'phoneNumber':phoneNumber};
      Map<String, dynamic>? result = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "get_user",
          prop
      );
      emit(Fetched(result!["getUser"]));
    }catch(_){
      emit(Failed());
    }
  }

  void _getTransaction(GetTransactionEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      var prop = {'phoneNumber':phoneNumber,'transactionId':event.transactionId};
      Map<String, dynamic>? result = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "get_transaction",
          prop
      );
      emit(Fetched(result!["getTransaction"]));
    }catch(_){
      emit(Failed());
    }
  }

  void _getBusiness(GetBusinessEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      var prop = {'phoneNumber':phoneNumber,'businessId':event.businessId};
      Map<String, dynamic>? result = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "get_business",
          prop
      );
      emit(Fetched(result!["getBusiness"]));
    }catch(_){
      emit(Failed());
    }
  }

  void _getParty(GetPartyEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{

      var prop = {'phoneNumber':phoneNumber,'partyId':event.partyId};
      Map<String, dynamic>? result = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "get_party",
          prop
      );

      emit(Fetched(ModelParty.fromJson(result!["getParty"])));
    }catch(_){
      emit(Failed());
    }
  }

  void _getItem(GetItemEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      var prop = {'phoneNumber':phoneNumber,'itemId':event.itemId};
      Map<String, dynamic>? result = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "get_item",
          prop
      );
      emit(Fetched(ModelItem.fromJson(result!["getItem"])));
    }catch(_){
      emit(Failed());
    }
  }

  void _getAllTransaction(GetAllTransactionEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      var prop = {'phoneNumber':phoneNumber};
      Map<String, dynamic>? result = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "get_all_transaction",
          prop
      );
      emit(Fetched(result!["getTransactions"]));
    }catch(_){
      emit(Failed());
    }
  }

  void _getAllBusiness(GetAllBusinessEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());
    try{
      var prop = {'phoneNumber':phoneNumber};
      Map<String, dynamic>? result = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "get_all_business",
          prop
      );
      emit(Fetched(result!["getAllBusiness"]));
    }catch(_){
      emit(Failed());
    }
  }

  void _getAllParty(GetAllPartyEvent event, Emitter<NetworkState> emit) async{

    emit(Loading());

    try{
      List<ModelParty> parties  = [];

      var prop = {'phoneNumber':phoneNumber};
      var result = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "get_all_party",
          prop
      );

      for(var element in result!["getParties"]){
        parties.add(ModelParty.fromJson(element));
      }

      emit(Fetched(parties));
    }catch(_){
      emit(Failed());
    }
  }

  void _getAllItem(GetAllItemEvent event, Emitter<NetworkState> emit) async{
    emit(Loading());

    try{
      List<ModelItem> items  = [];

      var prop = {'phoneNumber':phoneNumber};
      var result = await graphQlObject.getQueryValues(
          graphQlObject.graphQLClient,
          "get_all_item",
          prop
      );

      for(var element in result!["getItems"]){
        items.add(ModelItem.fromJson(element));
      }

      emit(Fetched(items));
    }catch(_){
      emit(Failed());
    }
  }

  dynamic getListMap(List<dynamic> data) {
    List<Map<String, dynamic>> dataMap = [];
    for (var element in data) {
      dataMap.add(element.toMap());
    }
    return dataMap;
  }

}