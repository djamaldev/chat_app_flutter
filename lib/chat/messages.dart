import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'message_bubble.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting || !snapShot.hasData) {
          CircularProgressIndicator();
        }
        final docs = snapShot.data!.docs;
        final user = FirebaseAuth.instance.currentUser;
        return ListView.builder(
            reverse: true,
            itemCount: docs.length,
            itemBuilder: (ctxx, index) => MessageBubble(
                message: docs[index]['text'],
                userName: docs[index]['username'],
                isMe: docs[index]['userId'] == user.uid,
                key: ValueKey(docs[index].id)));
      },
    );
  }
}
