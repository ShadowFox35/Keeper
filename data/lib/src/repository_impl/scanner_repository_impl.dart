import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/src/errors/exception_handler.dart';
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
      final ReceiptModel transaction = await _apiProvider.getCardTransactionInfo(
        GetTransactionInfoRequestMapper.fromPayload(payload),
      );
      return transaction.toDomain;
    } on DioException catch (dioException) {
      throw ExceptionHandler.handleException(dioException);
    } on Exception catch (exception) {
      throw ExceptionHandler.handleException(exception);
    } catch (error) {
      throw const AppException.unknown();
    }
  }
}
