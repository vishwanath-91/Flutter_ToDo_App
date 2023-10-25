import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../add_task_for_todo/add_task_page.dart';
import '../view_details/view_details_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uID = "";

  @override
  void initState() {
    super.initState();
    getUid();
  }

  Future<void> getUid() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        uID = user.uid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(uID)
                  .collection("tasks")
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        color: Colors.white70,
                        child: ListTile(
                          title:
                              Text(docs[index]["taskName"] ?? 'No Task Name'),
                          subtitle: Text(
                              docs[index]["description"] ?? 'No description'),
                          trailing: IconButton(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(uID)
                                  .collection("tasks")
                                  .doc(docs[index]
                                      .id) // Use index to get the document ID
                                  .delete();
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DetailsView(doc: docs[index]);
                              },
                            ));
                          },
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const AddTask();
            },
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
