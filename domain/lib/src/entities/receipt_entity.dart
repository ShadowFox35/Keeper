import 'package:core/core.dart';
import 'package:domain/src/entities/receipt_item_entity.dart';

class ReceiptEntity extends Equatable {
  final DateTime? timestamp;
  final String counterparty;
  final String address;
  final String currency;
  final String details;
  final double total;
  final List<ReceiptItemEntity> items;

  ReceiptEntity({
    required this.timestamp,
    required this.counterparty,
    required this.address,
    required this.currency,
    required this.details,
    required this.total,
    required this.items,
  });

  @override
  List<Object?> get props => <Object?>[
        timestamp,
        counterparty,
        address,
        currency,
        details,
        total,
        items,
      ];
}
