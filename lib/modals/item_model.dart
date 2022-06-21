import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:im/modals/pricing_model.dart';
import 'package:im/modals/stock_model.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class ModelItem extends Equatable{
  const ModelItem({
    required this.id,
    required this.name,
    required this.type,
    this.image,
    this.category,
    this.remark,
    this.pricing,
    this.stock
  });

  final String id;
  final String name;
  final String type;
  final String? image;
  final String? category;
  final String? remark;
  final ModelPricing? pricing;
  final ModelStock? stock;

  Map<String, dynamic> toJson() =>
      {
        'id':id,
        'name':name,
        'type':type,
        'image':image,
        'category':category,
        'remark':remark,
        'pricing':pricing,
        'Stock':stock
      };


  factory ModelItem.fromJson(Map<String, dynamic> data) {
    final id = data['id'] as String;
    final name = data['name'] as String;
    final type = data['type'] as String;
    final image = data['image'] as String?;
    final category = data['category'] as String?;
    final remark = data['remark'] as String?;
    final pricing = data['pricing']!=null?ModelPricing.fromJson(data['pricing']):null;
    final stock = data['stock']!=null?ModelStock.fromJson(data['stock']):null;

    return ModelItem(
        name: name,
        type: type,
        id: id,
        image: image,
        category: category,
        remark: remark,
        pricing: pricing,
        stock: stock,
    );
  }


  @override
  List<Object> get props => [id];
}