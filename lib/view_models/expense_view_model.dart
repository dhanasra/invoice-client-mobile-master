import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:im/app/app.dart';

class ExpenseViewModel{
  static late ExpenseViewModel _instance;

  factory ExpenseViewModel(App app) {
    _instance = ExpenseViewModel._internal();
    return _instance;
  }

  ExpenseViewModel._internal() {
    _init();
  }

  static bool paymentType = true;

  TextEditingController partyNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  StreamController splashLoad = StreamController<String>.broadcast();

  void _init() {

  }

}