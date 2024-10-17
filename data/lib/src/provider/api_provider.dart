import 'package:core/core.dart' hide Headers;
import 'package:data/data.dart';
import 'package:data/src/models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'api_provider.g.dart';

@RestApi()
abstract class ApiProvider {
  factory ApiProvider(Dio dio, {String? baseUrl}) = _ApiProvider;

  @POST(ApiConstants.parseImage)
  Future<TransactionModel> getCardTransactionInfo(
      @Body() GetCardTransactionInfoRequest payload);
}
