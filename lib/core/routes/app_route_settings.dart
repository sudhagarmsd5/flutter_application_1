import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/splash_screen.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import 'package:flutter_application_1/features/todos/presentation/pages/add_edit_todo.dart';
import 'package:flutter_application_1/features/todos/presentation/pages/home_todo.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  final Uri uri = Uri.parse(settings.name ?? '');
  final String? pathStr = uri.path;
  switch (settings.name) {
    case AppRoutes.initial:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case AppRoutes.todoHome:
      return MaterialPageRoute(builder: (context) => HomeTodo());
    case AppRoutes.todoAdd:
      return MaterialPageRoute(builder: (context) => AddEditTodo());
    case var _ when pathStr != null && pathStr.startsWith(AppRoutes.todoEdit):
      final id = pathStr.split('/').last;
      return MaterialPageRoute(builder: (_) => AddEditTodo(todoId: id));
    default:
      return MaterialPageRoute(builder: (context) => SplashScreen());
  }
}
