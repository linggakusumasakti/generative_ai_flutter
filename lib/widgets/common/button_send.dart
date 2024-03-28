import 'package:flutter/material.dart';

class ButtonSend extends StatelessWidget {
  const ButtonSend({super.key, required this.onTap, this.isDisable});

  final VoidCallback onTap;
  final bool? isDisable;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (isDisable ?? false) ? null : onTap,
      child: const Icon(
        Icons.send,
      ),
    );
  }
}
