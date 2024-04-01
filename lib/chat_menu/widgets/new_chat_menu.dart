import 'package:flutter/material.dart';

class NewChatMenu extends StatelessWidget {
  const NewChatMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.orangeAccent,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'New Chat',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.chat_bubble_outline_outlined,
              color: Colors.black54,
            )
          ],
        ));
  }

}