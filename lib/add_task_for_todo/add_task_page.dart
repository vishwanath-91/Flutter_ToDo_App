import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/add_task_for_todo/add_task_function.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();
  String uID = FirebaseAuth.instance.currentUser!.uid;
  String taskName = "";
  String description = "";
  String about = "";

  void valuePrint() {
    print(taskName);
    print(description);
    print(about);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task")),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Task Name";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Task Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onSaved: (newValue) {
                      taskName = newValue ?? "";
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Description";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onSaved: (newValue) {
                      description = newValue ?? "";
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Write your about information";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "About",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    maxLines: 4,
                    onSaved: (newValue) {
                      about = newValue ?? "";
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        valuePrint();
                        addTaskFunction(uID, taskName, description, about);
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
