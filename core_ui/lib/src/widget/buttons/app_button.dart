import 'package:core_ui/core_ui.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const AppButton({required this.title, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(),
      onPressed: onPressed,
      child: Text(
        title,
        style: AppFonts.montserratBold14
            .apply(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
