import 'package:flutter/material.dart';
import 'package:generative_ai_flutter/chat_menu/widgets/history_chat_section.dart';
import 'package:generative_ai_flutter/chat_menu/widgets/new_chat_menu.dart';

class ContentMenu extends StatelessWidget {
  const ContentMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        NewChatMenu(),
        SizedBox(
          height: 10,
        ),
        HistoryChatSection()
      ],
    );
  }
}
