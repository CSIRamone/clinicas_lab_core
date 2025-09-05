import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/src/loader/lab_clinicas_loader.dart';
import 'package:lab_clinicas_core/src/theme/lab_clinicas_theme.dart';

class LabClinicasCoreConfig extends StatelessWidget {
  const LabClinicasCoreConfig({
    super.key,
    this.bindings,
    this.pages,
    this.pagesBuilders,
    this.modules,
    required this.title,
  });

  final ApplicationBindings? bindings;
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pagesBuilders;
  final List<FlutterGetItModule>? modules;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      bindings: bindings,
      pages: [...pages ?? [], ...pagesBuilders ?? []],
      modules: [...modules ?? []],
      debugMode: kDebugMode,
      builder: (context, routes, flutterGetItNavObserver) {
        return AsyncStateBuilder(
          loader: LabClinicasLoader(),
          builder: (navigatorObservers) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: LabClinicasTheme.ligthTheme,
              darkTheme: LabClinicasTheme.darkTheme,
              navigatorObservers: [flutterGetItNavObserver, navigatorObservers],
              routes: routes,
              title: title,
            );
          },
        );
      },
    );
  }
}
