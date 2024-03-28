import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generative_ai_flutter/chat/bloc/chat_bloc.dart';
import 'package:generative_ai_flutter/chat/model/chat.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../widgets/item_chat_ai.dart';
import '../../widgets/item_chat_user.dart';

class ChatSection extends StatelessWidget {
  const ChatSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return ListView.separated(
            reverse: true,
            itemBuilder: (context, index) {
              bool isUser = state.chats?[index].role == Role.user;
              bool isLoading =
                  state.chatStatus == ChatStatus.loading && index == 0;
              String? text = state.chats?[index].text;

              if (isUser) {
                return Column(
                  children: [
                    ItemChatUser(text: text ?? ""),
                    Visibility(
                      visible: isLoading,
                      child: LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.orangeAccent.shade100, size: 30),
                    )
                  ],
                );
              }
              return ItemChatAI(
                text: text ?? "",
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 14,
              );
            },
            itemCount: state.chats?.length ?? 0);
      },
    );
  }
}
