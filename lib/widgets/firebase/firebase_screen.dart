import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseScreen extends StatefulWidget {
  @override
  _FirebaseScreenState createState() => _FirebaseScreenState();
}

class _FirebaseScreenState extends State<FirebaseScreen> {
  Map data;

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  addData() {
    Map<String, dynamic> demoData = {
      'name': 'Rural',
    };

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('categories');
    collectionReference.add(demoData);
  }

  fetchData(int index) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('categories');
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
        data = snapshot.docs[index].data();
        print(data['name'].toString());
      });
    });
  }

  @override
  void initState() {
    firebaseMessaging.getToken().then((value) {
      print(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chose Data'),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
              ),
              onPressed: addData,
            )
          ],
        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection('categories').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    fetchData(index);
                  },
                  title: Text(snapshot.data.documents[index]['name']),
                );
              },
              itemCount: snapshot.data.documents.length,
            );
          },
        ),
      ),
    );
  }
}
