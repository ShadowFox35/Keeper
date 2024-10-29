import 'package:data/src/models/receipt_item_model.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'receipt_model.g.dart';

@JsonSerializable(createToJson: false)
class ReceiptModel {
  @JsonKey(name: 'timestamp')
  final String timestamp;
  @JsonKey(name: 'counterparty')
  final String counterparty;
  @JsonKey(name: 'address')
  final String address;
  @JsonKey(name: 'currency')
  final String currency;
  @JsonKey(name: 'details')
  final String details;
  @JsonKey(name: 'total')
  final double total;
  @JsonKey(name: 'items')
  final List<ReceiptItemModel> items;

  ReceiptModel({
    required this.timestamp,
    required this.counterparty,
    required this.address,
    required this.currency,
    required this.details,
    required this.total,
    required this.items,
  });

  factory ReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptModelFromJson(json);
}

extension ReceiptModelExtension on ReceiptModel {
  ReceiptEntity get toDomain => ReceiptEntity(
        timestamp: DateTime.tryParse(timestamp),
        counterparty: counterparty,
        address: address,
        currency: currency,
        details: details,
        total: total,
        items: items.map((ReceiptItemModel item) => item.toDomain).toList(),
      );
}
