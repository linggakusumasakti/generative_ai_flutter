import 'package:flutter/cupertino.dart';
import 'package:generative_ai_flutter/widgets/common/chat_balloon.dart';
import 'package:generative_ai_flutter/widgets/common/empty_photo.dart';

class ItemChatAI extends StatelessWidget {
  const ItemChatAI({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const EmptyPhoto(initialName: 'AI'),
          const SizedBox(
            width: 5,
          ),
          ChatBalloon(
            text: text,
          )
        ],
      ),
    );
  }
}
