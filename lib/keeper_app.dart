import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class KeeperApp extends StatelessWidget {
  const KeeperApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = appLocator<AppRouter>();

    return EasyLocalization(
      path: AppLocalization.langFolderPath,
      supportedLocales: AppLocalization.supportedLocales,
      fallbackLocale: AppLocalization.fallbackLocale,
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: AutoRouterDelegate(
              appLocator.get<AppRouter>(),
            ),
            routeInformationParser:
                appLocator.get<AppRouter>().defaultRouteParser(),
            //TODO do we need this?
            // routerConfig: appRouter.config(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: lightTheme,
            darkTheme: darkTheme,
            builder: (BuildContext context, Widget? child) {
              final MediaQueryData mediaQueryData = MediaQuery.of(context);
              return MediaQuery(
                data: mediaQueryData.copyWith(
                    textScaler: const TextScaler.linear(1.0)),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
