import 'package:flutter/material.dart';

class AppTextStyles {
  final splashScreenTitle = Text(
    'Welcome to My App',
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  );

  final homeTitle = Text(
    'To-Do List',
    style: TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
  );

  Text addEditTitle(bool isEditTodoForm) {
    return Text(
      "${isEditTodoForm ? 'Edit' : 'Add'} New Task",
      style: TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  final addEditDueText = Text(
    'Due date helps you stay on the track!',
    style: TextStyle(fontSize: 16),
  );
}
