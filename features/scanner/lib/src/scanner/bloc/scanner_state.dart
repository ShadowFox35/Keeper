part of 'scanner_cubit.dart';

class ScannerState {
  final bool isLoading;
  final String? imagePath;

  ScannerState({
    required this.imagePath,
    this.isLoading = false,
  });

  factory ScannerState.init() => ScannerState(
        imagePath: null,
      );

  ScannerState copyWith({
    bool? isLoading,
    String? imagePath,
  }) {
    return ScannerState(
      imagePath: imagePath ?? imagePath,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
