import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:im/app/app.dart';

class InvoiceViewModel{
  static late InvoiceViewModel _instance;

  factory InvoiceViewModel(App app) {
    _instance = InvoiceViewModel._internal();
    return _instance;
  }

  InvoiceViewModel._internal() {
    _init();
  }

  static List<String> additionalItemsList = ["null"];
  static List<String> additionalAmountList = ["null"];

  static List<String> contactsList = ["One","Two","Three","Four"];

  TextEditingController partyNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  StreamController splashLoad = StreamController<String>.broadcast();

  void _init() {

  }

}