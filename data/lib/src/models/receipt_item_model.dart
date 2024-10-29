import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'receipt_item_model.g.dart';

@JsonSerializable(createToJson: false)
class ReceiptItemModel extends JsonSerializable {
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
  final double quantity;

  ReceiptItemModel({
    required this.name,
    required this.details,
    required this.includeInTotal,
    required this.category,
    required this.price,
    required this.quantity,
  });

  factory ReceiptItemModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptItemModelFromJson(json);
}

extension ReceiptItemModelExtension on ReceiptItemModel {
  ReceiptItemEntity get toDomain {
    return ReceiptItemEntity(
      name: name,
      details: details,
      includeInTotal: includeInTotal,
      category: category,
      price: price,
      quantity: quantity,
    );
  }
}
