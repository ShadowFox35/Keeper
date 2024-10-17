import 'package:domain/domain.dart';

class SubmitImageUseCase implements FutureUseCase<TransactionEntity, GetTransactionInfoPayload> {
  final ScannerRepository _scannerRepository;

  SubmitImageUseCase({
    required ScannerRepository scannerRepository,
  }) : _scannerRepository = scannerRepository;

  @override
  Future<TransactionEntity> execute(GetTransactionInfoPayload payload) {
    return _scannerRepository.getCardTransactionInfo(payload);
  }
}
