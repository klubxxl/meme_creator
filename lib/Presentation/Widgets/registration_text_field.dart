import 'package:flutter/material.dart';
import 'package:meme_creator/Presentation/Style/app_typography.dart';
import 'package:meme_creator/Presentation/Style/colors.dart';
import 'package:meme_creator/Presentation/Style/dimens.dart';

class TextFormRegistration extends StatelessWidget {
  TextFormRegistration({
    required this.title,
    required this.formText,
    this.onChanged,
    this.imageOn,
    this.imageOff,
    this.errorMessage,
    Key? key,
  }) : super(key: key);

  final String title, formText;
  final Widget? imageOn, imageOff;
  final String? errorMessage;
  final bool showPassword = false;
  final ValueChanged<String>? onChanged;

  final ValueNotifier<bool> _isObscured = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Topography.caption.copyWith(fontSize: 16),
        ),
        const SizedBox(height: Dimens.xs),
        Center(
          child: ValueListenableBuilder(
            valueListenable: _isObscured,
            builder: (ctx, val, _) => TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(Dimens.m),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: isValid() ? MemeColors.grey : MemeColors.error),
                  borderRadius: BorderRadius.circular(Dimens.m),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: isValid() ? MemeColors.grey : MemeColors.error),
                  borderRadius: BorderRadius.circular(Dimens.m),
                ),
                hintText: formText,
                hintStyle: Topography.body1.copyWith(
                    color: MemeColors.textDisabled,
                    fontWeight: FontWeight.w400),
                suffixIcon: (imageOn != null && imageOff != null)
                    ? GestureDetector(
                        onTap: _changePasswordVisibility,
                        child: _isObscured.value ? imageOff : imageOn)
                    : null,
              ),
              obscureText: _isObscured.value,
            ),
          ),
        ),
        if (errorMessage != null)
          Text(
            errorMessage ?? ' ',
            style: Topography.caption,
          ),
      ],
    );
  }

  void _changePasswordVisibility() {
    _isObscured.value = !_isObscured.value;
  }

  bool isValid() {
    if (errorMessage == null || errorMessage == ' ' || errorMessage == '') {
      return true;
    } else {
      return false;
    }
  }
}
