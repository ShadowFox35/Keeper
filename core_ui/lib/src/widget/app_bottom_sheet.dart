import 'package:core_ui/core_ui.dart';

class AppBottomSheetWidget extends StatelessWidget {
  final VoidCallback onCameraPressed;
  final VoidCallback onStoragePressed;

  const AppBottomSheetWidget({
    required this.onCameraPressed,
    required this.onStoragePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(20.0),
      children: <Widget>[
        AppButton(
          title: 'Make Photo',
          onPressed: onCameraPressed,
        ),
        const SizedBox(height: 10.0),
        AppButton(
          title: 'Choose Image',
          onPressed: onStoragePressed,
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
