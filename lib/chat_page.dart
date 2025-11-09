import 'package:convoconnect/core/theme.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage('assets/avatar.png')),
            SizedBox(width: 10),
            Text('Eleven', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildReceivedMessage(
                  context,
                  "Hello! How can I assist you today?",
                ),

                _buildSentMessage(context, "Hi! I need help with my account."),
                _buildReceivedMessage(
                  context,
                  "Sure! What seems to be the issue?",
                ),
                _buildSentMessage(context, "I can't log in to my account."),
                _buildReceivedMessage(context, 'hehehe😂😂'),
              ],
            ),
          ),
          _buildMessageInput(context),
        ],
      ),
    );
  }

  Widget _buildReceivedMessage(BuildContext context, String message) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(right: 30, top: 5, bottom: 5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: DefaultColors.receiverMessage,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        child: Text(message, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }

  Widget _buildSentMessage(BuildContext context, String message) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(left: 30, top: 5, bottom: 5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: DefaultColors.senderMessage,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(0),
            topRight: Radius.circular(16),
          ),
        ),
        child: Text(message, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DefaultColors.sentMessageInput,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.camera_alt_outlined,
              color: DefaultColors.greyText,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type a message",
                hintStyle: TextStyle(color: DefaultColors.greyText),
                border: InputBorder.none,
              ),
              style: TextStyle(color: DefaultColors.whiteText),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.send, color: DefaultColors.greyText),
          ),
        ],
      ),
    );
  }
}
