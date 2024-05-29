import 'package:flutter/material.dart' show BuildContext, MaterialApp, MediaQuery, TextScaler, Widget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart' show AppLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;
import 'package:go_router/go_router.dart';

import 'constants/constants.dart' show appName;
import 'extensions/extensions.dart' show BuildContextExtension;
import 'localization/loalization.dart' show localizationsDelegates, onGenerateTitle, supportedLocales, t;
import 'modules/home/view/home.view.dart';
import 'modules/setting/view/setting.view.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      localizationsDelegates: localizationsDelegates,
      // theme: ref.watch(themeProvider).theme,
      supportedLocales: supportedLocales,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: onGenerateTitle,
      restorationScopeId: appName,
      routerConfig: _router,
      builder: (context, child) {
        t = AppLocalizations.of(context)!;
        return MediaQuery(
          data: context.mq.copyWith(textScaler: const TextScaler.linear(1)),
          child: child ?? const HomeView(),
        );
      },
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'setting',
          builder: (BuildContext context, GoRouterState state) {
            return const SettingView();
          },
        ),
      ],
    ),
  ],
);
