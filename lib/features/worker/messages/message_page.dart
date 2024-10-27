import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:job2main/features/worker/messages/chat_bubble.dart';
import 'package:job2main/features/worker/messages/widget/text_field.dart';

class MessagePage extends StatefulWidget {
  final String receiveEmail;
  final List<String> members;
  final String reveiveId;
  final String receiveFirstNameName;
  MessagePage(
      {super.key,
      required this.receiveEmail,
      required this.reveiveId,
      required this.receiveFirstNameName,
      required this.members});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 500), () => scrollDown());
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {}


  }

  Widget _buildMessageItem() {
      bool isCurrentUser = true;
      var alignment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
      return Container(
          alignment: alignment,
          child: Column(
            crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [ChatBubble(message: "fssdfsd", isCurrentUser: isCurrentUser)],
          ));
    }

    Widget _buildUserInput() {
      return Padding(
        padding: const EdgeInsets.all(50.0),
        child: Row(
          children: [
            Expanded(
              child: MyTextfield(
                controller: _messageController,
                focusNode: _focusNode,
                hintText: 'Type a message...',
                obscureText: false,
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(50)),
              margin: const EdgeInsets.only(left: 0.0),
              child: IconButton(
                  onPressed: sendMessage, icon: const Icon(Icons.send, color: Colors.white)),
            )
          ],
        ),
      );
    }
  
  @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
              title: Text(widget.receiveFirstNameName, style: const TextStyle(color: Colors.black)),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.grey,
              elevation: 0),
          body: Column(children: [
            _buildUserInput(),
          ]));
    }
}
