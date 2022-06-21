import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:im/modals/bank_model.dart';
import 'package:im/modals/money_model.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class ModelBusiness extends Equatable{
  const ModelBusiness({
    required this.businessId,
    required this.businessName,
    this.businessLogo,
    this.businessPhoneNumber,
    required this.businessType,
    this.industryType,
    this.bankDetails,
    this.upiId,
    this.billingAddress,
    this.gstin,
    this.placeOfSupply,
    this.termsAndConditions,
    this.Signature,
    this.money
  });

  final String businessId;
  final String businessName;
  final String? businessLogo;
  final String? businessPhoneNumber;
  final String businessType;
  final String? industryType;
  final ModelBank? bankDetails;
  final String? upiId;
  final String? billingAddress;
  final String? gstin;
  final String? placeOfSupply;
  final String? termsAndConditions;
  final String? Signature;
  final ModelMoney? money;

  Map<String, dynamic> toJson() =>
      {
        'businessId':businessId,
        'businessName':businessName,
        'businessLogo':businessLogo,
        'businessPhoneNumber':businessPhoneNumber,
        'businessType':businessType,
        'industryType':industryType,
        'bankDetails':bankDetails,
        'upiId':upiId,
        'billingAddress':billingAddress,
        'gstin':gstin,
        'placeOfSupply':placeOfSupply,
        'termsAndConditions':termsAndConditions,
        'Signature':Signature,
        'money':money
      };

  @override
  List<Object> get props => [businessId];
}