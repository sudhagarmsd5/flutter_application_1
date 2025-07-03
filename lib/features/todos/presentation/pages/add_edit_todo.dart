import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/core.dart';

import 'package:reactive_forms/reactive_forms.dart';

class AddEditTodo extends StatefulWidget {
  final String? todoId;
  const AddEditTodo({super.key, this.todoId});

  @override
  State<AddEditTodo> createState() => _AddEditTodoState();
}

class _AddEditTodoState extends State<AddEditTodo> {
  final FormGroup form = FormGroup({
    'taskName': FormControl<String>(validators: [Validators.required]),
    'description': FormControl<String>(),
    'dueDate': FormControl<DateTime>(validators: [Validators.required]),
    'complete': FormControl<bool>(value: false),
  });

  var isEditTodoForm = false;

  @override
  void initState() {
    super.initState();
    print("TODO ID: ${widget.todoId}");
    if (widget.todoId != null) {
      isEditTodoForm = true;
      final mockTodo = {
        'taskName': 'Sample Task',
        'description': 'Sample Description',
        'dueDate': DateTime.now(),
        'complete': true,
      };
      form.patchValue(mockTodo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.todoHome,
                      );
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),
                  SizedBox(width: 10),
                  AppTextStyles().addEditTitle(isEditTodoForm),
                ],
              ),
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
                  child: ReactiveForm(
                    formGroup: form,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          ReactiveTextField<String>(
                            formControlName: 'taskName',
                            decoration: InputDecoration(
                              labelText: 'Task Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                          SizedBox(height: 50),

                          ReactiveTextField<String>(
                            formControlName: 'description',
                            decoration: InputDecoration(
                              labelText: 'Description',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            maxLines: 4,
                          ),
                          SizedBox(height: 50),

                          ReactiveDatePicker<DateTime>(
                            formControlName: 'dueDate',
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100),
                            initialDate: DateTime.now(),
                            builder: (context, picker, child) => InkWell(
                              onTap: picker.showPicker,
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  labelText: 'Due Date',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  errorText:
                                      form.control('dueDate').invalid &&
                                          form.control('dueDate').touched
                                      ? 'Due date is required'
                                      : null,
                                ),
                                child: Text(
                                  picker.value == null
                                      ? 'Select Date'
                                      : picker.value.toString().split(' ')[0],
                                ),
                              ),
                            ),
                          ),

                          ...(isEditTodoForm
                              ? [
                                  SizedBox(height: 50),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 30.0,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Mark as Complete',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(width: 10),
                                        ReactiveSwitch(
                                          formControlName: 'complete',
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (form.valid) {
                                        print(form.value);
                                      } else {
                                        form.markAllAsTouched();
                                      }
                                    },
                                    child: Text('Update Task'),
                                  ),
                                  SizedBox(height: 20),

                                  ElevatedButton(
                                    onPressed: () {
                                      if (form.valid) {
                                        print(form.value);
                                      } else {
                                        form.markAllAsTouched();
                                      }
                                    },
                                    child: Text('Delete Task'),
                                  ),
                                ]
                              : [
                                  SizedBox(height: 20),

                                  AppTextStyles().addEditDueText,
                                  SizedBox(height: 40),

                                  ElevatedButton(
                                    onPressed: () {
                                      if (form.valid) {
                                        print(form.value);
                                      } else {
                                        form.markAllAsTouched();
                                      }
                                    },
                                    child: Text('Submit'),
                                  ),
                                ]),
                        ],
                      ),
                    ),
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
