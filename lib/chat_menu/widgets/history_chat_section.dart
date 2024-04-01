import 'package:flutter/material.dart';
import 'package:generative_ai_flutter/widgets/common/chat_balloon.dart';

class HistoryChatSection extends StatelessWidget {
  const HistoryChatSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return  ChatBalloon(text: "test12345", bgColor: Colors.grey.shade300,);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 14,
          );
        },
        itemCount: 10);
  }
}
