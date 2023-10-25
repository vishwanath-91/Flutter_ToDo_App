import 'package:cloud_firestore/cloud_firestore.dart'; // Added import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/update_todo_task/update_function.dart';

class UpdateToDoTask extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> doc;

  const UpdateToDoTask({Key? key, required this.doc})
      : super(key: key); // Fixed the Key parameter

  @override
  State<UpdateToDoTask> createState() => _UpdateToDoTaskState();
}

class _UpdateToDoTaskState extends State<UpdateToDoTask> {
  final _fromKey = GlobalKey<FormState>();
  String uID = FirebaseAuth.instance.currentUser!.uid;
  String taskName = "";
  String description = "";
  String about = "";

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? data =
        widget.doc.data() as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(title: const Text("Update Task")),
      body: SingleChildScrollView(
        // Added SingleChildScrollView to allow scrolling if the keyboard covers the form
        child: Column(children: [
          Form(
            key: _fromKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    enabled: false,
                    initialValue: data?['taskName'],
                    // Initialize with the existing value
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
                        )),
                    onSaved: (newValue) {
                      taskName = newValue.toString();
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    initialValue: data?['description'],
                    // Initialize with the existing value
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
                        )),
                    onSaved: (newValue) {
                      description = newValue.toString();
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    initialValue: data?['about'],
                    // Initialize with the existing value
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
                        )),
                    maxLines: 4,
                    onSaved: (newValue) {
                      about = newValue.toString();
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_fromKey.currentState!.validate()) {
                        _fromKey.currentState!.save();
                        updateTaskFunction(uID, taskName, description, about);
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
