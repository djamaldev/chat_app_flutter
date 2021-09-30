import 'package:chatappv2/chat/messages.dart';
import 'package:chatappv2/chat/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        actions: [
          DropdownButton(
            items: [
              DropdownMenuItem(child: Row(children: [
                Icon(Icons.exit_to_app),
                Text('Logout'),
              ],), value: 'logout',)
            ],
            onChanged: (itemIdentifier){
              if(itemIdentifier == 'logout'){
                FirebaseAuth.instance.signOut();
              }
            },
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Message()),
            NewMessage()
          ],
        ),
      ),
    );
  }
}
