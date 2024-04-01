import 'package:flutter/material.dart';
import 'package:generative_ai_flutter/chat_menu/widgets/content_menu.dart';
import 'package:generative_ai_flutter/chat_menu/widgets/title_menu.dart';

class ChatMenu extends StatelessWidget {
  const ChatMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
      titlePadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
      backgroundColor: Colors.transparent,
      title: const TitleMenu(),
      content: AnimatedBuilder(
        animation: ModalRoute.of(context)!.animation!,
        builder: (context, child) {
          final double slide =
              1.0 - (ModalRoute.of(context)?.animation?.value ?? 0.0);
          return Transform(
            transform: Matrix4.translationValues(slide * 300, 0, 0),
            child: child,
          );
        },
        child: Container(
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
            child: ListView(
              children: const [ContentMenu()],
            ),
          ),
        ),
      ),
    );
  }
}
