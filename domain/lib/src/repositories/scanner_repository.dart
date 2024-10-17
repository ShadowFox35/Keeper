import 'package:domain/domain.dart';

abstract interface class ScannerRepository {
  Future<TransactionEntity> getCardTransactionInfo(GetTransactionInfoPayload payload);
}
