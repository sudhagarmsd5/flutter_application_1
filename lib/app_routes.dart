import 'package:flutter_application_1/common/widgets/splash_screen.dart';
import 'package:flutter_application_1/features/todos/presentation/pages/add_todo.dart';
import 'package:flutter_application_1/features/todos/presentation/pages/edit_todo.dart';
import 'package:flutter_application_1/features/todos/presentation/pages/home_todo.dart';
import 'package:go_router/go_router.dart';

final appRoutes = GoRouter(
  initialLocation: '/',
  // redirect: (context, state) => '/homeTodo',
  routes: [
    GoRoute(
      name: 'splashScreen',
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      name: 'homeTodo',
      path: '/homeTodo',
      builder: (context, state) => HomeTodo(),
    ),
    GoRoute(
      name: 'addTodo',
      path: '/addTodo',
      builder: (context, state) => AddTodo(),
    ),
    GoRoute(
      name: 'editTodo',
      path: '/editTodo',
      builder: (context, state) => EditTodo(),
    ),
  ],
);
