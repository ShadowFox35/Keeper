import 'package:data/src/models/transaction_item_model.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable(createToJson: false)
class TransactionModel {
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
  @JsonKey(name: 'items')
  final List<TransactionItemModel> items;

  TransactionModel({
    required this.timestamp,
    required this.counterparty,
    required this.address,
    required this.currency,
    required this.details,
    required this.items,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}

extension TransactionModelExtension on TransactionModel {
  TransactionEntity get toDomain => TransactionEntity(
        timestamp: DateTime.tryParse(timestamp),
        counterparty: counterparty,
        address: address,
        currency: currency,
        details: details,
        items: items.map((TransactionItemModel item) => item.toDomain).toList(),
      );
}
