import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:im/app/app.dart';
import 'package:im/bloc/network_event.dart';
import 'package:im/modals/item_model.dart';
import 'package:im/modals/pricing_model.dart';
import 'package:im/modals/stock_model.dart';

import '../bloc/network_bloc.dart';

class ItemViewModel{
  static late ItemViewModel _instance;

  factory ItemViewModel(App app) {
    _instance = ItemViewModel._internal();
    return _instance;
  }

  ItemViewModel._internal() {
    _init();
  }

  var selectedUnit = "";

  static String currentItemId = '';

  TextEditingController itemNameController = TextEditingController();
  TextEditingController mrpController = TextEditingController();
  TextEditingController salesPriceController = TextEditingController();
  TextEditingController wholeSalePriceController = TextEditingController();
  TextEditingController purchasePriceController = TextEditingController();
  TextEditingController itemCodeController = TextEditingController();
  TextEditingController minWholeSaleQuantityController = TextEditingController();
  TextEditingController lowStockQuantityController = TextEditingController();
  TextEditingController openingStockController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController hsnController = TextEditingController();

  var asOfDate = '';
  var itemType = 'product';
  var isPriceWithTax = false;

  Map<String,String> units= {
    "NONE": "NONE",
    "COPY": "COPY",
    "PETI": "PET",
    "JARS": "JAR",
    "FEET": "FT",
    "INCHES": "IN",
    "CASE": "CASE",
    "PAD": "PAD",
    "TABLETS": "TBS",
    "TONNES": "TON",
    "UNITS": "UNT",
    "YARDS": "YDS",
    "HOURS": "HRS",
    "LITRE": "LTR",
    "MILLIGRAM": "MLG",
    "BOX": "BOX",
    "CAN": "CAN",
    "CENTIMETER": "CM",
    "KILOGRAMS": "KGS",
    "KILOMETRE": "KME",
    "ACRE": "AC",
  };

  void _init() {

  }

  createItem(BuildContext context,NetworkBloc bloc){
    if(itemNameController.text.isNotEmpty){
      var item = ModelItem(
        id:Utils.generateId('item'),
        name:itemNameController.text,
        type:itemType,
        image: '',
        category: '',
        remark: remarkController.text,
        pricing: ModelPricing(
            salesPrice: salesPriceController.text,
            purchasePrice: purchasePriceController.text,
            wholeSalePrice: wholeSalePriceController.text,
            wholeSaleQuantity: minWholeSaleQuantityController.text,
            mrp: mrpController.text,
            unit: selectedUnit,
            hsn: hsnController.text,
            gst: gstController.text,
            isPriceWithTax: isPriceWithTax
        ),
        stock: ModelStock(
            stockValue: openingStockController.text,
            asOfDate: asOfDate,
            lowStockQuantity: lowStockQuantityController.text,
            itemCode: itemCodeController.text,
            isLowStockWarning: lowStockQuantityController.text.isNotEmpty
        ),
      );
      bloc.add(AddItemEvent(item));
    }else{
      Utils.showSnackBar(context: context, message: 'Item name should not be empty');
    }
  }

}