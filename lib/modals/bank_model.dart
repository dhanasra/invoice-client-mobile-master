import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class ModelBank extends Equatable{
  const ModelBank({
    required this.accountHolderName,
    required this.accountNumber,
    required this.bankBranchName,
    required this.ifscCode
  });

  final String accountNumber;
  final String accountHolderName;
  final String ifscCode;
  final String bankBranchName;

  Map<String, dynamic> toJson() =>
      {
        'accountNumber':accountNumber,
        'accountHolderName':accountHolderName,
        'ifscCode':ifscCode,
        'bankBranchName':bankBranchName
      };

  @override
  List<Object> get props => [];
}