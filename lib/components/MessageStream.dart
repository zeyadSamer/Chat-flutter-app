import 'package:flutter/material.dart';
import 'MessageBubble.dart';


class MessageStream extends StatelessWidget {

  MessageStream({this.fireStore,this.currentUser});
  final fireStore;
  final currentUser;



  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: fireStore.collection('messages').orderBy('date',descending:true).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {

            return Center(
              child:
              CircularProgressIndicator(

              ),

            );
          } else {
            final  messages = snapshot.data.docs;
            print(messages.runtimeType);
            List<Widget> messageWidgets = [];

            for (var message in messages) {

              final messageText = message.data()['text'];
              final messageSender = message.data()['sender'];
              print('$currentUser ? $messageSender');

              final messageWidget =MessageBubble(sender: messageSender,
                  message: messageText,
                  isMe:currentUser==messageSender);

              messageWidgets.add(messageWidget);
            }

            return Expanded(

              child: ListView(
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),

                children: messageWidgets,
              ),
            );
          }
        });
  }
}



