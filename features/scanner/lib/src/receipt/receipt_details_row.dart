import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ReceiptDetailsRow extends StatelessWidget {
  final VoidCallback onTap;
  final String receiptItemName;
  final double receiptItemPrice;
  final double receiptItemQuantity;
  final String receiptItemDetails;

  ReceiptDetailsRow({
    required this.receiptItemName,
    required this.receiptItemPrice,
    required this.receiptItemQuantity,
    required this.receiptItemDetails,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Row(
          children: <Widget>[
            Container(
              height: 36.0,
              width: 36.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        receiptItemDetails,
                      ),
                      Text(
                        receiptItemPrice.toString(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        receiptItemName,
                      ),
                      Text(
                        receiptItemQuantity.toString(),
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
