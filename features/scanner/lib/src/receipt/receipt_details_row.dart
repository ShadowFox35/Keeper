import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ReceiptDetailsRow extends StatelessWidget {
  final String receiptItemName;
  final double receiptItemPrice;
  final double receiptItemQuantity;
  final String receiptItemDetails;

  ReceiptDetailsRow({
    required this.receiptItemName,
    required this.receiptItemPrice,
    required this.receiptItemQuantity,
    required this.receiptItemDetails,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Row(
          children: <Widget>[
            Container(
              height: 36.0,
              width: 36.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.shopping_bag),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    receiptItemName,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        receiptItemQuantity.toString(),
                      ),
                      const SizedBox(width: 12.0),
                      Text(
                        receiptItemPrice.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
