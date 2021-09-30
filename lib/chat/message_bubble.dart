import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.message, required this.userName, required this.isMe, required this.key});

  final Key key;
  final String message;
  final String userName;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: isMe
                  ? Colors.blueGrey
                  : Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                  bottomLeft: isMe ? Radius.circular(0) : Radius.circular(14),
                  bottomRight:
                      isMe ? Radius.circular(0) : Radius.circular(14))),
          width: 150,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                message,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: isMe ? TextAlign.end : TextAlign.start,
              ),
            ],
          ),
        )
      ],
    );
  }
}
