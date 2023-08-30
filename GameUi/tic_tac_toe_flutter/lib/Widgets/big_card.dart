import 'package:flutter/material.dart';

class CenteredButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CenteredButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        onPrimary: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(text),
      ),
    );
  }
}
