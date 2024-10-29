import 'dart:io';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:navigation/navigation.dart';

import 'package:scanner/src/scanner/bloc/scanner_cubit.dart';

@RoutePage<String>()
class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider<ScannerCubit>(
          create: (BuildContext context) => ScannerCubit(
            appRouter: appLocator<AppRouter>(),
            submitImageUseCase: appLocator.get(),
            permissionManager: appLocator.get(),
            imagePickerService: appLocator.get(),
          ),
          child: BlocBuilder<ScannerCubit, ScannerState>(
              builder: (BuildContext context, ScannerState state) {
            return SingleChildScrollView(
              child: Column(
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
                  AppButton(
                    title: 'Make Photo',
                    onPressed:
                        context.read<ScannerCubit>().handleAddImageFromCamera,
                  ),
                  const SizedBox(height: 16.0),
                  AppButton(
                    title: 'Choose Image',
                    onPressed:
                        context.read<ScannerCubit>().handleAddImageFromStorage,
                  ),
                  const SizedBox(height: 16.0),
                  AppButton(
                    title: 'Delete Images',
                    onPressed: context.read<ScannerCubit>().handleDeleteImages,
                  ),
                  const SizedBox(height: 16.0),
                  AppButton(
                    title: 'Submit',
                    onPressed: context.read<ScannerCubit>().handleSubmitImages,
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
}
