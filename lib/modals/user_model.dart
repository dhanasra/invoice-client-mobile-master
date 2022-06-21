import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class ModelUser extends Equatable{
    const ModelUser({
      this.name,
      required this.phoneNumber,
      this.language,
      this.email
    });

    final String? name;
    final String phoneNumber;
    final String? language;
    final String? email;

    Map<String, dynamic> toJson() =>
        {
          'name':name,
          'phoneNumber':phoneNumber,
          'language':language,
          'email':email
        };

    @override
    List<Object> get props => [phoneNumber];
}