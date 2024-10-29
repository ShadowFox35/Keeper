import 'package:domain/domain.dart';

abstract interface class ScannerRepository {
  Future<ReceiptEntity> getCardTransactionInfo(GetTransactionInfoPayload payload);
}
