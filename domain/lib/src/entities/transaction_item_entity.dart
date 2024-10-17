import 'package:core/core.dart';

class TransactionItemEntity extends Equatable {
  final String name;
  final String details;
  final bool includeInTotal;
  final String category;
  final double price;
  final int quantity;

  TransactionItemEntity({
    required this.name,
    required this.details,
    required this.includeInTotal,
    required this.category,
    required this.price,
    required this.quantity,
  });

  @override
  List<Object?> get props => <Object?>[
        name,
        details,
        includeInTotal,
        category,
        price,
        quantity,
      ];
}
