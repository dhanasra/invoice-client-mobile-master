import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
@JsonSerializable(nullable: false)
class ModelParty extends Equatable{
  const ModelParty({
    required this.id,
    required this.name,
    required this.type,
    this.phoneNumber,
    this.gstin,
    this.billingAddress,
    this.shippingAddress,
    this.creditPeriod,
    this.creditLimit,
    this.placeOfSupply,
    this.balance,
    this.isPay
  });

  final String id;
  final String name;
  final String type;
  final String? phoneNumber;
  final String? gstin;
  final String? billingAddress;
  final String? shippingAddress;
  final String? creditPeriod;
  final String? creditLimit;
  final String? placeOfSupply;
  final String? balance;
  final bool? isPay;

  Map<String, dynamic> toJson() =>
      {
        'id':id,
        'name':name,
        'type':type,
        'phoneNumber':phoneNumber,
        'gstin':gstin,
        'balance':balance,
        'billingAddress':billingAddress,
        'shippingAddress':shippingAddress,
        'creditPeriod':creditPeriod,
        'creditLimit':creditLimit,
        'placeOfSupply':placeOfSupply,
        'isPay':isPay
      };

  factory ModelParty.fromJson(Map<String, dynamic> data) {
    final id = data['id'] as String;
    final name = data['name'] as String;
    final type = data['type'] as String;
    final phoneNumber = data['phoneNumber'] as String?;
    final gstin = data['gstin'] as String?;
    final billingAddress = data['billingAddress'] as String?;
    final shippingAddress = data['shippingAddress'] as String?;
    final creditPeriod = data['creditPeriod'] as String?;
    final creditLimit = data['creditLimit'] as String?;
    final placeOfSupply = data['placeOfSupply'] as String?;
    final balance = data['balance'] as String?;
    final isPay = data['isPay'] as bool?;
    return ModelParty(
      name: name,
      type: type,
      id: id,
      phoneNumber: phoneNumber,
      gstin: gstin,
      billingAddress: billingAddress,
      shippingAddress: shippingAddress,
      creditLimit: creditLimit,
      creditPeriod: creditPeriod,
      balance: balance,
      placeOfSupply:placeOfSupply,
      isPay: isPay
    );
  }

  @override
  List<Object> get props => [id];
}