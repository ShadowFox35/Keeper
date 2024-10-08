import 'package:core/core.dart';

sealed class CoreEvent extends AppEvent {
  const CoreEvent();
}

class InternetConnectionLostEvent extends CoreEvent {
  const InternetConnectionLostEvent();
}
