import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:im/modals/item_model.dart';
import 'package:im/modals/party_model.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class ModelTransaction extends Equatable{
  const ModelTransaction({
    required this.id,
    required this.no,
    required this.date,
    required this.dueDate,
    this.party,
    this.item,
    this.discountPercent,
    this.discountAmount,
    this.roundOff,
    this.isRoundOffMinus,
    this.subTotal,
    required this.total,
    this.amountReceived,
    this.notes,
    required this.type,
    this.paymentMode
  });

  final String id;
  final String no;
  final String date;
  final String dueDate;
  final ModelParty? party;
  final List<ModelItem>? item;
  final String? discountPercent;
  final String? discountAmount;
  final String? roundOff;
  final bool? isRoundOffMinus;
  final String? subTotal;
  final String total;
  final String? amountReceived;
  final String? notes;
  final String type;
  final String? paymentMode;

  Map<String, dynamic> toJson() =>
      {
        'id':id,
        'no':no,
        'date':date,
        'dueDate':dueDate,
        'party':party,
        'item':item,
        'discountPercent':discountPercent,
        'discountAmount':discountAmount,
        'roundOff':roundOff,
        'isRoundOffMinus':isRoundOffMinus,
        'subTotal':subTotal,
        'total':total,
        'amountReceived':amountReceived,
        'notes':notes,
        'type':type,
        'paymentMode':paymentMode
      };

  @override
  List<Object> get props => [id];
}