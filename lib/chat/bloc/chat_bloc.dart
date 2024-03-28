import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generative_ai_flutter/chat/model/chat.dart';
import 'package:generative_ai_flutter/utils/const.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

part 'chat_event.dart';

part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState()) {
    on<ChatStarted>(_onChatStarted);
    on<ChatInitial>(_onChatInitial);
    on<ChatResponse>(_onChatResponse);
    on<ChatDisable>(_onChatSend);
  }

  List<Chat> chats = [];
  List<Content> contents = [];
  final model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey,
      generationConfig: GenerationConfig(maxOutputTokens: 1000));

  late ChatSession chat = model.startChat(history: contents);

  void _onChatInitial(ChatInitial event, Emitter<ChatState> emit) {
    emit(state.copyWith(chats: chats));
  }

  Future<void> _onChatStarted(
      ChatStarted event, Emitter<ChatState> emit) async {
    chats.insert(0, Chat(text: event.text, role: Role.user));
    emit(state.copyWith(
        text: event.text,
        chatStatus: ChatStatus.success,
        chats: chats,
        isDisable: true));
    await generativeChat(event.text, event, emit);
  }

  Future<void> _onChatResponse(
      ChatResponse event, Emitter<ChatState> emit) async {
    emit(state.copyWith(
        text: event.text, chatStatus: ChatStatus.success, chats: chats));
  }

  void _onChatSend(ChatDisable event, Emitter<ChatState> emit) {
    emit(state.copyWith(isDisable: event.isDisable));
  }

  Future<void> generativeChat(
      String text, ChatStarted event, Emitter<ChatState> emit) async {
    emit(state.copyWith(chatStatus: ChatStatus.loading));
    var response = await chat.sendMessage(Content.text(text));
    chats.insert(0, Chat(text: response.text ?? '', role: Role.ai));
    add(ChatResponse(response.text ?? ''));
  }
}
