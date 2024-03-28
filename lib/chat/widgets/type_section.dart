import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generative_ai_flutter/widgets/common/button_send.dart';
import 'package:generative_ai_flutter/widgets/common/custom_text_field.dart';

import '../bloc/chat_bloc.dart';

class TypeSection extends StatelessWidget {
  TypeSection({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return SafeArea(
          bottom: true,
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey.shade400),
              ),
              color: Colors.white,
            ),
            child: Row(
              children: [
                CustomTextField(
                  controller: controller,
                  onChanged: (value) {
                    context.read<ChatBloc>().add(ChatDisable(value.isEmpty));
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                ButtonSend(
                    isDisable: state.isDisable,
                    onTap: () {
                      context
                          .read<ChatBloc>()
                          .add(ChatStarted(controller.text));
                      controller.clear();
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
