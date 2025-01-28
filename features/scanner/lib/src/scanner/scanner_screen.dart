import 'dart:io';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:navigation/navigation.dart';
import 'package:scanner/src/scanner/cubit/scanner_cubit.dart';

@RoutePage<String>()
class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider<ScannerCubit>(
          create: (BuildContext context) => ScannerCubit(
            appRouter: appLocator.get(),
            submitImageUseCase: appLocator.get(),
            permissionManager: appLocator.get(),
            imagePickerService: appLocator.get(),
          ),
          child: BlocConsumer<ScannerCubit, ScannerState>(listener: (
            BuildContext context,
            ScannerState state,
          ) {
            final String? message = state.errorMessage;
            if (message != null) {
              MainPopup.showPopup(
                context: context,
                message: message,
                isSuccess: false,
              );
            }
          }, builder: (BuildContext context, ScannerState state) {
            return SingleChildScrollView(
              child: state.isLoading
                  ? const AppLoader()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: state.imagePath == null
                              ? SvgPicture.asset(
                                  AppImages.emptyScanner,
                                  height: 300.0,
                                  width: 300.0,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.of(context).accent,
                                    BlendMode.srcIn,
                                  ),
                                )
                              : Image.file(
                                  File(state.imagePath!),
                                  height: 300.0,
                                  width: 300.0,
                                ),
                        ),
                        const SizedBox(height: 24.0),
                        AppButton(
                          title: 'Add Image',
                          onPressed: () => handleAddImages(context),
                        ),
                        const SizedBox(height: 16.0),
                        AppButton(
                          title: 'Submit',
                          onPressed: context.read<ScannerCubit>().handleSubmitImages,
                        ),
                        const SizedBox(height: 16.0),
                        AppButton(
                          title: 'Delete Images',
                          onPressed: context.read<ScannerCubit>().handleDeleteImages,
                        ),
                        const SizedBox(height: 16.0),
                      ],
                    ),
            );
          }),
        ),
      ),
    );
  }

  void handleAddImages(BuildContext context) {
    void closeBottomSheetAnd(Function action) {
      action();
      Navigator.of(context).pop();
    }

    showModalBottomSheet(
      context: context,
      builder: (_) => AppBottomSheetWidget(
        onCameraPressed: () => closeBottomSheetAnd(() => context.read<ScannerCubit>().handleAddImageFromCamera()),
        onStoragePressed: () => closeBottomSheetAnd(() => context.read<ScannerCubit>().handleAddImageFromStorage()),
      ),
    );
  }
}
