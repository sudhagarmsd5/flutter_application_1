import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';

class HomeTodo extends StatefulWidget {
  const HomeTodo({super.key});

  @override
  State<HomeTodo> createState() => _HomeTodo();
}

class _HomeTodo extends State<HomeTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: AppTextStyles().homeTitle,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.ternaryColor,
                  // color: Colors.amberAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(42),
                    topRight: Radius.circular(42),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Stack(
                    children: [
                      ListView.builder(
                        itemCount: 5,
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 25,
                        ),
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 4,
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              leading: Checkbox(
                                value: false,
                                onChanged: (bool? value) {},
                              ),
                              title: Text('data'),
                              subtitle: Text('12'),
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '${AppRoutes.todoEdit}$index',
                                );
                              },
                            ),
                          );
                        },
                      ),
                      Positioned(
                        bottom: 30,
                        right: 16,
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.todoAdd);
                          },
                          backgroundColor: AppColors.secondaryColor,
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
