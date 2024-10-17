import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/src/models/models.dart';
import 'package:data/src/provider/api_provider.dart';
import 'package:domain/domain.dart';

class ScannerRepositoryImpl implements ScannerRepository {
  final ApiProvider _apiProvider;

  const ScannerRepositoryImpl(this._apiProvider);

  @override
  Future<TransactionEntity> getCardTransactionInfo(
    GetTransactionInfoPayload payload,
  ) async {
    try {
      final TransactionModel transaction =
          await _apiProvider.getCardTransactionInfo(
        GetTransactionInfoRequestMapper.fromPayload(payload),
      );
      print('TAG transaction payload $payload');
      print('TAG transaction provider $transaction');
      return transaction.toDomain;
    } on DioException catch (e, stackTrace) {
      print('TAG DioException transaction provider $e $stackTrace');
      return Future.error(e);
    }

    // return transaction.toDomain;
  }
}
