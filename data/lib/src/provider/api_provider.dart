import 'package:core/core.dart' hide Headers;
import 'package:data/src/entities/draft_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'api_provider.g.dart';

@RestApi()
abstract class ApiProvider {
  factory ApiProvider(Dio dio, {String? baseUrl}) = _ApiProvider;

  @POST(ApiConstants.draftPath)
  Future<DraftEntity> createRefund(@Body() DraftEntity entity,
      @Header(ApiConstants.tokenHeader) String? token);

  @GET(ApiConstants.draftPath)
  Future<DraftEntity> draft(@Path() String refundRRN);

  @POST(ApiConstants.draftPath)
  Future<void> newDraft(@Body() DraftEntity entity);
}
