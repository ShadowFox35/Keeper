import 'package:core/core.dart';
//TODO remove to core usecase
abstract interface class UseCase<OutputT, InputT> {
  OutputT execute(InputT payload);
}

abstract interface class FutureUseCase<OutputT, InputT> {
  Future<OutputT> execute(InputT payload);
}

abstract interface class StreamUseCase<OutputT, InputT> {
  Stream<OutputT> execute(InputT payload);
}

class NoPayload extends Equatable {
  const NoPayload();

  @override
  List<Object> get props => <Object>[];
}
