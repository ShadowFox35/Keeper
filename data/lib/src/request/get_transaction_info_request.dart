import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_transaction_info_request.g.dart';

@JsonSerializable(createFactory: false)
class GetCardTransactionInfoRequest extends JsonSerializable {
  @JsonKey(name: 'base64image')
  final String base64image;

  GetCardTransactionInfoRequest({
    required this.base64image,
  });

  @override
  Map<String, dynamic> toJson() => _$GetCardTransactionInfoRequestToJson(this);
}

abstract class GetTransactionInfoRequestMapper {
  static GetCardTransactionInfoRequest fromPayload(
      GetTransactionInfoPayload payload) {
    return GetCardTransactionInfoRequest(
      base64image: payload.base64image,
    );
  }
}
