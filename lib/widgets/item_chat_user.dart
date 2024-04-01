import 'package:flutter/material.dart';

import 'common/chat_balloon.dart';
import 'common/empty_photo.dart';

class ItemChatUser extends StatelessWidget {
  const ItemChatUser({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: ChatBalloon(
                  bgColor: Colors.orangeAccent.shade100,
                  text: text,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const EmptyPhoto(initialName: 'US'),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
