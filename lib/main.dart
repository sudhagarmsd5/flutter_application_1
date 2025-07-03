import 'package:flutter_application_1/core/core.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      onGenerateRoute: onGenerateRoutes,
      navigatorObservers: [AppRouteObserver()],
    );
  }
}

void main() {
  runApp(const MainApp());
}
