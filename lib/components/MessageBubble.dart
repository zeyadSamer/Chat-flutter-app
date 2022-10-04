import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({@required this.sender,@required this.message,@required this.isMe});

  final String sender;
  final String message;

  final bool isMe;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),

      child: Column(
        crossAxisAlignment:isMe? CrossAxisAlignment.end:CrossAxisAlignment.start,


        children: [

          Text(
              sender,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54
              )


          ),
          Material(
            color:isMe? Colors.lightBlue: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),

              child: Text(message,
                style: TextStyle(
                    fontSize: 15,
                    color:isMe? Colors.white:Colors.black54

                ),


              ),
            ),
            elevation: 15,
            borderRadius:isMe? kCurrentUserBorderStyle:kAnotherUserBorderStyle,


          )


        ],


      ),


    );
  }
}