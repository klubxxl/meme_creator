import 'package:flutter/material.dart';
import 'package:meme_creator/Presentation/Style/app_typography.dart';
import 'package:meme_creator/Presentation/Style/colors.dart';
import 'package:meme_creator/Presentation/Style/dimens.dart';

class MemeButton extends StatelessWidget {
  MemeButton(
      {this.title = 'Create',
      required this.onTap,
      this.isActive = true,
      Key? key})
      : super(key: key);

  final Color backgroundColor = MemeColors.mainColorDefault;
  final Color disabledColor = MemeColors.grey;
  final Color textColor = MemeColors.white;
  final Color disabledTextColor = MemeColors.textDisabled;
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Dimens.m),
        decoration: BoxDecoration(
          color: isActive ? backgroundColor : disabledColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(Dimens.m),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Topography.body1
              .copyWith(color: isActive ? textColor : disabledTextColor),
        ),
      ),
    );
  }
}
