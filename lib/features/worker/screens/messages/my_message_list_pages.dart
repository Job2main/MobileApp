import 'package:flutter/material.dart';
import 'package:job2main/features/worker/screens/messages/message_page.dart';

class MyMessageListPages extends StatelessWidget {
  MyMessageListPages({super.key});
  // final MessageService messageService = MessageService();
  // final User? user = Auth().currentUser;

  // Widget _buildUserList() {
  //   return StreamBuilder(
  //     stream: messageService.getChatStream(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasError) {
  //         return const Center(child: Text('Something went wrong'));
  //       }
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const Center(child: CircularProgressIndicator());
  //       }
  //       if (!snapshot.hasData || snapshot.data!.isEmpty) {
  //         return const Center(child: Text('No messages found'));
  //       }
  //       return ListView.separated(
  //         itemCount: snapshot.data!.length,
  //         separatorBuilder: (context, index) => const Divider(height: 32, thickness: 1),
  //         itemBuilder: (context, index) => _buildUserListItem(snapshot.data![index], context),
  //       );
  //     },
  //   );
  // }

  // Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
  //   // TODO: ADD error handling to check if array contains info
  //   String otherParticipantId = (userData['participants'] as List).firstWhere(
  //     (id) => id != user!.uid,
  //     orElse: () => user!.uid,
  //   );

  //   String otherParticipantName = (userData[otherParticipantId]["firstname"] ?? otherParticipantId) + " " + (userData[otherParticipantId]["name"] ?? "");
  //   const String profilePictureUrl = 'asset/image.jpg';

  //   return ListTile(
  //     leading: const CircleAvatar(
  //       backgroundImage: AssetImage(profilePictureUrl),
  //     ),
  //     title: Text(
  //       otherParticipantName,
  //       style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //     ),

  //     trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
  //     onTap: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => MessagePage(
  //             receiveEmail: userData[otherParticipantId]['email'] ?? "",
  //             reveiveId: otherParticipantId,
  //             members: userData['participants'].cast<String>(),
  //             receiveFirstNameName: otherParticipantName,
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Messages'),
        centerTitle: false,
      ),
      body: const Column(
        children: [
          // _buildUserList(),
        ],
      ),
    );
  }
}
