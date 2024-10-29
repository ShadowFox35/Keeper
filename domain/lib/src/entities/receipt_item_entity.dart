import 'package:core/core.dart';

class ReceiptItemEntity extends Equatable {
  final String name;
  final String details;
  final bool includeInTotal;
  final String category;
  final double price;
  final double quantity;

  ReceiptItemEntity({
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
