import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class ModelPricing extends Equatable{
  const ModelPricing({
    required this.salesPrice,
    required this.purchasePrice,
    this.wholeSalePrice,
    this.wholeSaleQuantity,
    this.mrp,
    required this.unit,
    this.hsn,
    this.gst,
    required this.isPriceWithTax
  });

  final String salesPrice;
  final String? purchasePrice;
  final String? wholeSalePrice;
  final String? wholeSaleQuantity;
  final String? mrp;
  final String? unit;
  final String? hsn;
  final String? gst;
  final bool? isPriceWithTax;

  Map<String, dynamic> toJson() =>
      {
        'salesPrice':salesPrice,
        'purchasePrice':purchasePrice,
        'wholeSalePrice':wholeSalePrice,
        'wholeSaleQuantity':wholeSaleQuantity,
        'mrp':mrp,
        'unit':unit,
        'hsn':hsn,
        'gst':gst,
        'isPriceWithTax':isPriceWithTax
      };

  factory ModelPricing.fromJson(Map<String, dynamic> data) {
    final salesPrice = data['salesPrice'] as String;
    final purchasePrice = data['purchasePrice'] as String?;
    final wholeSalePrice = data['wholeSalePrice'] as String?;
    final wholeSaleQuantity = data['wholeSaleQuantity'] as String?;
    final mrp = data['mrp'] as String?;
    final unit = data['unit'] as String?;
    final hsn = data['hsn'] as String?;
    final gst = data['gst'] as String?;
    final isPriceWithTax = data['isPriceWithTax'] as bool?;

    return ModelPricing(
      salesPrice: salesPrice,
      purchasePrice: purchasePrice,
      wholeSalePrice: wholeSalePrice,
      wholeSaleQuantity: wholeSaleQuantity,
      mrp: mrp,
      unit: unit,
      hsn: hsn,
      gst: gst,
      isPriceWithTax: isPriceWithTax
    );
  }

  @override
  List<Object> get props => [salesPrice];
}