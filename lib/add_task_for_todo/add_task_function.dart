import 'package:cloud_firestore/cloud_firestore.dart';

void addTaskFunction(
    String uId, String taskName, String description, String about) {
  FirebaseFirestore.instance
      .collection("users")
      .doc(uId)
      .collection("tasks")
      .doc(taskName)
      .set({
    "taskName": taskName,
    "description": description,
    "about": about,
  });
}
