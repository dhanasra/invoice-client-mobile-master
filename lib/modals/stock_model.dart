import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class ModelStock extends Equatable{
  const ModelStock({
    this.stockValue,
    this.lowStockQuantity,
    this.asOfDate,
    this.isLowStockWarning,
    this.itemCode
  });

  final String? stockValue;
  final String? asOfDate;
  final String? lowStockQuantity;
  final String? itemCode;
  final bool? isLowStockWarning;

  Map<String, dynamic> toJson() =>
      {
        'stockValue':stockValue,
        'asOfDate':asOfDate,
        'lowStockQuantity':lowStockQuantity,
        'itemCode':itemCode,
        'isLowStockWarning':isLowStockWarning
      };

  factory ModelStock.fromJson(Map<String, dynamic> data) {
    final stockValue = data['stockValue'] as String?;
    final asOfDate = data['asOfDate'] as String?;
    final lowStockQuantity = data['lowStockQuantity'] as String?;
    final itemCode = data['itemCode'] as String?;
    final isLowStockWarning = data['isLowStockWarning'] as bool?;

    return ModelStock(
        stockValue: stockValue,
        asOfDate: asOfDate,
        lowStockQuantity: lowStockQuantity,
        itemCode: itemCode,
        isLowStockWarning: isLowStockWarning
    );
  }

  @override
  List<Object> get props => [];
}