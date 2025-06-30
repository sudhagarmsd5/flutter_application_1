import 'package:flutter/material.dart';

class HomeTodo extends StatefulWidget {
  const HomeTodo({super.key});

  @override
  State<HomeTodo> createState() => _HomeTodo();
}

class _HomeTodo extends State<HomeTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('data')));
  }
}
