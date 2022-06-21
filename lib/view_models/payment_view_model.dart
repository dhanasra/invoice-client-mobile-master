import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:im/app/app.dart';

class PaymentViewModel{
  static late PaymentViewModel _instance;

  factory PaymentViewModel(App app) {
    _instance = PaymentViewModel._internal();
    return _instance;
  }

  PaymentViewModel._internal() {
    _init();
  }

  TextEditingController partyNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  StreamController splashLoad = StreamController<String>.broadcast();

  void _init() {

  }

}