import 'package:core_ui/core_ui.dart';

class MainPopup {
  static void showPopup({
    required BuildContext context,
    required String message,
    required bool isSuccess,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: <Widget>[
            Icon(
              isSuccess ? Icons.check_circle : Icons.error_outline,
              color: isSuccess ? AppColors.of(context).mainText : AppColors.of(context).accent,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: AppFonts.montserratBold14.copyWith(
                  color: isSuccess ? AppColors.of(context).mainText : AppColors.of(context).accent,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.of(context).primary,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
