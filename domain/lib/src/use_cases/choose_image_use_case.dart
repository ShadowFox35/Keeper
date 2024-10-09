import 'package:domain/domain.dart';

class ChooseImageUseCase implements FutureUseCase<String, NoPayload> {
  final ScannerRepository _scannerRepository;

  ChooseImageUseCase({
    required ScannerRepository scannerRepository,
  }) : _scannerRepository = scannerRepository;

  @override
  Future<String> execute(NoPayload payload) {
    return _scannerRepository.getImage();
  }
}
