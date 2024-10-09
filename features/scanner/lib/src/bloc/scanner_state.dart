part of 'scanner_cubit.dart';

class ScannerState {
  final String imagePath;

  ScannerState({
    required this.imagePath,
  });

  factory ScannerState.init() => ScannerState(
        imagePath: '',
      );

  ScannerState copyWith({
    String? imagePath,
  }) {
    return ScannerState(
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
