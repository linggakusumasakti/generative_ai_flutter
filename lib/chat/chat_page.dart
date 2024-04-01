import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generative_ai_flutter/chat/bloc/chat_bloc.dart';
import 'package:generative_ai_flutter/chat/widgets/chat_section.dart';
import 'package:generative_ai_flutter/chat/widgets/type_section.dart';
import 'package:generative_ai_flutter/chat_menu/chat_menu.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatBloc()..add(const ChatInitial()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Chat"),
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const ChatMenu();
                        });
                  },
                  icon: const Icon(
                    Icons.list_rounded,
                    color: Colors.black54,
                  ))
            ],
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [const Expanded(child: ChatSection()), TypeSection()],
          )),
    );
  }
}
