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
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (state.imagePathList.isNotEmpty)
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.imagePathList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Image.file(
                            File(state.imagePathList[index]),
                          ),
                        );
                      },
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
                        context.read<ScannerCubit>().handleAddFilesFromStorage,
                  ),
                  const SizedBox(height: 16.0),
                  AppButton(
                    title: 'Delete Images',
                    onPressed: context.read<ScannerCubit>().deleteImages,
                  ),
                  const SizedBox(height: 16.0),
                  AppButton(
                    title: 'Submit',
                    onPressed: context.read<ScannerCubit>().submitImages,
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
