import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/src/models/models.dart';
import 'package:data/src/provider/api_provider.dart';
import 'package:domain/domain.dart';

class ScannerRepositoryImpl implements ScannerRepository {
  final ApiProvider _apiProvider;

  const ScannerRepositoryImpl(this._apiProvider);
  @override
  Future<ReceiptEntity> getCardTransactionInfo(
    GetTransactionInfoPayload payload,
  ) async {
    try {
      final ReceiptModel transaction =
          await _apiProvider.getCardTransactionInfo(
        GetTransactionInfoRequestMapper.fromPayload(payload),
      );
      return transaction.toDomain;
    } on DioException catch (e, stackTrace) {
      print('TAG DioException transaction provider $e $stackTrace');
      return Future.error(e);
    }

  }
}
