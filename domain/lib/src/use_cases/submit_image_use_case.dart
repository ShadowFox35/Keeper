import 'package:domain/domain.dart';

class SubmitImageUseCase implements FutureUseCase<ReceiptEntity, GetTransactionInfoPayload> {
  final ScannerRepository _scannerRepository;

  SubmitImageUseCase({
    required ScannerRepository scannerRepository,
  }) : _scannerRepository = scannerRepository;

  @override
  Future<ReceiptEntity> execute(GetTransactionInfoPayload payload) {
    return _scannerRepository.getCardTransactionInfo(payload);
  }
}
