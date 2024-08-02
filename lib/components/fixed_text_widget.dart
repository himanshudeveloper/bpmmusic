import 'package:flutter/material.dart';

class FixedTextWidget extends StatelessWidget {
  final String text;
  final int maxCharacters;

  const FixedTextWidget({super.key, required this.text, required this.maxCharacters});

  @override
  Widget build(BuildContext context) {
    String displayText =
        text.length > maxCharacters ? text.substring(0, maxCharacters) : text;

    return Text(displayText);
  }
}
