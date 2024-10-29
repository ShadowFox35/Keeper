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
    final ReceiptEntity mock = ReceiptEntity(
        timestamp: DateTime.now(),
        counterparty: 'counterparty',
        address: 'address',
        currency: 'USD',
        details: 'details',
        total: 20.0,
        items: <ReceiptItemEntity>[
          ReceiptItemEntity(
            name: 'name',
            details: 'details',
            includeInTotal: true,
            category: 'category',
            price: 2.0,
            quantity: 2.0,
          ),
          ReceiptItemEntity(
            name: 'name2',
            details: 'details2',
            includeInTotal: true,
            category: 'category2',
            price: 3.0,
            quantity: 3.0,
          )
        ]);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: mock.items.length,
              itemBuilder: (BuildContext context, int index) {
                final ReceiptItemEntity item = mock.items[index];
                return ReceiptDetailsRow(
                  onTap: () => {},
                  // Navigator.pushNamed(
                  //   context,
                  //   Routes.transactionDetails,
                  //   arguments: transaction,
                  // ),
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
