import 'package:flutter/material.dart';
import 'package:meme_creator/Presentation/Style/images.dart';

class PageHeadline extends StatelessWidget {
  PageHeadline(
      {this.title = 'Nice to see you! Create an account first.',
      this.image = Images.registrationEmoi,
      Key? key})
      : super(key: key);

  String title;
  String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Color(0xFF27425A)),
        ),
      ],
    );
  }
}
