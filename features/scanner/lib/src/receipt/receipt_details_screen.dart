import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';
import 'package:scanner/src/receipt/receipt_details_row.dart';

@RoutePage<String>()
class ReceiptDetailsScreen extends StatelessWidget {
  final ReceiptEntity receipt;

  const ReceiptDetailsScreen({
    required this.receipt,
  });

  //TODO layout
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: receipt.items.length,
              itemBuilder: (BuildContext context, int index) {
                final ReceiptItemEntity item = receipt.items[index];
                return ReceiptDetailsRow(
                  receiptItemName: item.name,
                  receiptItemPrice: item.price,
                  receiptItemQuantity: item.quantity,
                  receiptItemDetails: item.details,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
