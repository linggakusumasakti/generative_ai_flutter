import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.controller, this.onChanged});

  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: ShapeDecoration(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.grey.shade400)),
        ),
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          textCapitalization: TextCapitalization.sentences,
          maxLines: null,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          decoration: const InputDecoration.collapsed(
            hintText: 'Type a message',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
