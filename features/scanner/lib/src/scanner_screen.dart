import 'dart:io';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:navigation/navigation.dart';

import 'package:scanner/src/bloc/scanner_cubit.dart';

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
            chooseImageUseCase: appLocator.get(),
            permissionManager: appLocator.get(),
            imagePickerService: appLocator.get(),
          ),
          child: BlocBuilder<ScannerCubit, ScannerState>(
              builder: (BuildContext context, ScannerState state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'ScannerScreen',
                ),
                const SizedBox(height: 24.0),
                if (state.imagePath.isNotEmpty)
                  Image.file(File(state.imagePath)),

                AppButton(
                  title: 'Make Photo',
                  onPressed:
                      context.read<ScannerCubit>().handleAddImageFromCamera,
                ),
                // AppButton(
                //   title: 'Choose Image',
                //   onPressed:
                //       context.read<ScannerCubit>().handleAddFilesFromStorage,
                // ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
