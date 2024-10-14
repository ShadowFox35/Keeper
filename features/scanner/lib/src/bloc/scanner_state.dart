part of 'scanner_cubit.dart';

class ScannerState {
  final List<String> imagePathList;

  ScannerState({
    required this.imagePathList,
  });

  factory ScannerState.init() => ScannerState(
        imagePathList: <String>[],
      );

  ScannerState copyWith({
    List<String>? imagePathList,
  }) {
    return ScannerState(
      imagePathList: imagePathList ?? this.imagePathList,
    );
  }
}
