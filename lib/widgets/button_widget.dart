import 'package:flutter/material.dart';

class Buttonwidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const Buttonwidget({Key? key, required this.text, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      child: Text(text),
      style: ElevatedButton.styleFrom(shape: StadiumBorder()),
    );
  }
}
