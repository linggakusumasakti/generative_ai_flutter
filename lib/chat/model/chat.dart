import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  const Chat({required this.text, required this.role});

  final String text;
  final Role role;

  @override
  List<Object?> get props => [text, role];
}

enum Role { user, ai }
