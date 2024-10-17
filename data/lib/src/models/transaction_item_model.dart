import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_item_model.g.dart';

@JsonSerializable(createToJson: false)
class TransactionItemModel extends JsonSerializable {
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String details;
  @JsonKey(defaultValue: true)
  final bool includeInTotal;
  @JsonKey(defaultValue: '')
  final String category;
  @JsonKey(defaultValue: 0)
  final double price;
  @JsonKey(defaultValue: 0)
  final int quantity;

  TransactionItemModel({
    required this.name,
    required this.details,
    required this.includeInTotal,
    required this.category,
    required this.price,
    required this.quantity,
  });

  factory TransactionItemModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemModelFromJson(json);
}

extension TransactionItemModelExtension on TransactionItemModel {
  TransactionItemEntity get toDomain {
    return TransactionItemEntity(
      name: name,
      details: details,
      includeInTotal: includeInTotal,
      category: category,
      price: price,
      quantity: quantity,
    );
  }
}
