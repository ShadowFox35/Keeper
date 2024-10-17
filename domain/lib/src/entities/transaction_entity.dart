import 'package:core/core.dart';
import 'package:domain/src/entities/transaction_item_entity.dart';

class TransactionEntity extends Equatable {
  final DateTime? timestamp;
  final String? counterparty;
  final String? address;
  final String? currency;
  final String? details;
  final List<TransactionItemEntity> items;

  TransactionEntity({
    required this.timestamp,
    required this.counterparty,
    required this.address,
    required this.currency,
    required this.details,
    required this.items,
  });

  @override
  List<Object?> get props => <Object?>[
        timestamp,
        counterparty,
        address,
        currency,
        details,
        items,
      ];
}
