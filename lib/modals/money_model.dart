import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class ModelMoney extends Equatable{
  const ModelMoney({
    this.toPay = "0",
    this.toCollect = "0",
    this.cash = "0",
    this.bank = "0",
    this.stockValue = "0"
  });

  final String toPay;
  final String toCollect;
  final String cash;
  final String bank;
  final String stockValue;

  Map<String, dynamic> toJson() =>
      {
        'toPay':toPay,
        'toCollect':toCollect,
        'cash':cash,
        'bank':bank,
        'stockValue':stockValue
      };

  @override
  List<Object> get props => [];
}