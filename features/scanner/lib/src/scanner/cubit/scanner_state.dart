part of 'scanner_cubit.dart';

class ScannerState {
  final bool isLoading;
  final String? imagePath;
  final String? errorMessage;

  ScannerState({
    required this.imagePath,
    required this.errorMessage,
    required this.isLoading,
  });

  factory ScannerState.init() => ScannerState(
        imagePath: null,
        isLoading: false,
        errorMessage: null,
      );

  ScannerState copyWith({
    bool? isLoading,
    String? imagePath,
    String? errorMessage,
    bool resetErrorMessage = false,
  }) {
    return ScannerState(
      imagePath: imagePath ?? this.imagePath,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: resetErrorMessage ? null : errorMessage ?? this.errorMessage,
    );
  }
}
