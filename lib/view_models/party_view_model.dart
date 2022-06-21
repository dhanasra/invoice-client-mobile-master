import 'dart:async';

import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:im/app/app.dart';
import 'package:im/bloc/network_bloc.dart';
import 'package:im/bloc/network_event.dart';
import 'package:im/modals/party_model.dart';

class PartyViewModel{
  static late PartyViewModel _instance;

  factory PartyViewModel(App app) {
    _instance = PartyViewModel._internal();
    return _instance;
  }

  PartyViewModel._internal() {
    _init();
  }

  static String currentPartyId = '';

  TextEditingController partyNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController gstInController = TextEditingController();
  TextEditingController billingAddressController = TextEditingController();
  TextEditingController placeOfSupplyController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  var partyType = 'customer';
  var isPay = false;
  StreamController splashLoad = StreamController<String>.broadcast();

  void _init() {

  }

  createParty(BuildContext context,NetworkBloc bloc){
    if(partyNameController.text.isNotEmpty){
      var party = ModelParty(
          id:Utils.generateId('party'),
          name:partyNameController.text,
          type:partyType,
          phoneNumber:partyNameController.text,
          gstin:gstInController.text,
          billingAddress:billingAddressController.text,
          shippingAddress:billingAddressController.text,
          balance: balanceController.text,
          isPay: isPay,
          creditLimit:'',
          placeOfSupply: placeOfSupplyController.text,
          creditPeriod:'',
      );
      bloc.add(AddPartyEvent(party));
    }else{
      Utils.showSnackBar(context: context, message: 'Party name should not be empty');
    }
  }
}