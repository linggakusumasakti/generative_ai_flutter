part of 'chat_bloc.dart';

enum ChatStatus { initial, loading, success, fail }

final class ChatState extends Equatable {
  const ChatState(
      {this.text,
      this.chatStatus = ChatStatus.initial,
      this.chats,
      this.isDisable = true});

  final ChatStatus chatStatus;
  final String? text;
  final List<Chat>? chats;
  final bool? isDisable;

  @override
  List<Object?> get props => [chatStatus, text, chats, isDisable];

  ChatState copyWith(
      {ChatStatus? chatStatus,
      String? text,
      List<Chat>? chats,
      bool? isDisable}) {
    return ChatState(
        text: text ?? this.text,
        chatStatus: chatStatus ?? this.chatStatus,
        chats: chats ?? this.chats,
        isDisable: isDisable ?? this.isDisable);
  }
}
