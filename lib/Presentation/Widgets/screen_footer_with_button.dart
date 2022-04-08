import 'package:flutter/material.dart';

class ScreenFooter extends StatelessWidget {
  ScreenFooter(
      {required this.onTapButton,
      this.text = 'Don\'t have an account? ',
      this.buttonText = 'Sign up!',
      Key? key})
      : super(key: key);

  String text;
  String buttonText;
  Function onTapButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 16, color: Color(0xFF27425A)),
        ),
        TextButton(
          onPressed: () {
            onTapButton();
          },
          child: Text(
            buttonText,
            style: const TextStyle(
                color: Color(0xFF27425A),
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ],
    );
  }
}
