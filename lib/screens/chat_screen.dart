import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('chats/BK48NlctlumFwrmXdy6z/text').snapshots(),
        builder: (ctx, snapShot){
          if(snapShot.connectionState == ConnectionState.waiting){
            CircularProgressIndicator();
          }
          final docs = snapShot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (ctx, index) => Container(
              child: Text(docs[index]['textmsg']),
              padding: EdgeInsets.all(8),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          /*FirebaseFirestore.instance.collection('chats/BK48NlctlumFwrmXdy6z/text').snapshots().listen((event) {
            print(event.docs[0]['textmsg']);});*/
          FirebaseFirestore.instance.collection('chats/BK48NlctlumFwrmXdy6z/text').add({
      'textmsg': 'Clic button'
    });

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
