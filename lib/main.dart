import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_routes.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRoutes,
    );
  }
}

void main() {
  runApp(const MainApp());
}
