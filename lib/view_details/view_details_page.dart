import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/update_todo_task/update_page.dart';

class DetailsView extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> doc;

  const DetailsView({Key? key, required this.doc}) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? data =
        widget.doc.data() as Map<String, dynamic>?;

    if (data == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Details View")),
        body: const Center(
          child: Text("Data is missing or invalid"),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Details View")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Task Name: ${data['taskName']?.toString().toUpperCase() ?? 'No Task Name'}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Description: ${data['description'] ?? 'No description'}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              "About: ${data['about'] ?? 'No information'}",
              style: const TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return UpdateToDoTask(
                            doc: widget.doc); // Pass the document directly
                      },
                    ));
                  },
                  icon: const Icon(
                    Icons.update,
                  ),
                  label: const Text("Update"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
