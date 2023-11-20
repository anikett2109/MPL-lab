import 'package:flutter/material.dart';

class DiscussionForumPage extends StatefulWidget {
  @override
  _DiscussionForumPageState createState() => _DiscussionForumPageState();
}

class _DiscussionForumPageState extends State<DiscussionForumPage> {
  final TextEditingController messageController = TextEditingController();
  final List<Map<String, String>> messages = [
    {'username': 'User1', 'text': 'Hello, how is everyone doing?'},
    {'username': 'User2', 'text': 'Great! How about you?'},
    {'username': 'User3', 'text': 'I have a business-related question.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 23, 45),
      appBar: AppBar(
        title: const Text('Discussion Forum'),
        backgroundColor: const Color.fromARGB(255, 0, 23, 45),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration:  BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: messageController,
                        decoration: const InputDecoration(
                          hintText: 'Type your message...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      _sendMessage();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 25,),

            Expanded(
              child: ListView(
                children: [
                  // Display existing messages
                  for (Map<String, String> message in messages)
                    MessageCard(
                      username: message['username']!,
                      text: message['text']!,
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Row(
            //   children: [
            //     Expanded(
            //       child: TextField(
            //         controller: messageController,
            //         decoration: const InputDecoration(
            //           hintText: 'Type your message...',
            //         ),
            //       ),
            //     ),

            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  // Function to send a new message
  void _sendMessage() {
    String text = messageController.text;

    if (text.isNotEmpty) {
      setState(() {
        messages.add({'username': 'CurrentUser', 'text': text});
      });

      // Clear the message input
      messageController.clear();
    }
  }
}


class MessageCard extends StatelessWidget {
  final String username;
  final String text;

  MessageCard({required this.username, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: const Color.fromARGB(83, 158, 158, 158),
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User: $username',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Message: $text',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
