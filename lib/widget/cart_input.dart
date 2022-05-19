import 'package:flutter/material.dart';

Widget cardInput({
  required TextEditingController controller,
  required String hint,
  required bool isSecure,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(bottom: 6, top: 8, left: 20, right: 20),
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: const Color(0xffd6d6d6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: controller,
          obscureText: isSecure,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    ],
  );
}
