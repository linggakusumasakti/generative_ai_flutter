part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();
}

final class ChatInitial extends ChatEvent {
  const ChatInitial({this.chats});

  final List<String>? chats;

  @override
  List<Object?> get props => [chats];
}

final class ChatStarted extends ChatEvent {
  const ChatStarted(this.text);

  final String text;

  @override
  List<Object?> get props => [text];
}

final class ChatResponse extends ChatEvent {
  const ChatResponse(this.text);

  final String text;

  @override
  List<Object?> get props => [text];
}

final class ChatDisable extends ChatEvent {
  const ChatDisable(this.isDisable);

  final bool isDisable;

  @override
  List<Object?> get props => [isDisable];
}
