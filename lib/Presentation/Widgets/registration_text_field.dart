import 'package:flutter/material.dart';
import 'package:meme_creator/Presentation/Style/app_typography.dart';
import 'package:meme_creator/Presentation/Style/colors.dart';
import 'package:meme_creator/Presentation/Style/dimens.dart';

class TextFormRegistration extends StatefulWidget {
  const TextFormRegistration({
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

  @override
  State<TextFormRegistration> createState() => _TextFormRegistrationState();
}

class _TextFormRegistrationState extends State<TextFormRegistration> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured =
        (widget.imageOn != null && widget.imageOff != null) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Topography.caption.copyWith(fontSize: 16),
        ),
        const SizedBox(height: Dimens.xs),
        Center(
          child: TextField(
            onChanged: widget.onChanged,
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
              hintText: widget.formText,
              hintStyle: Topography.body1.copyWith(
                  color: MemeColors.textDisabled, fontWeight: FontWeight.w400),
              suffixIcon: (widget.imageOn != null && widget.imageOff != null)
                  ? GestureDetector(
                      onTap: _changePasswordVisibility,
                      child: _isObscured ? widget.imageOff : widget.imageOn)
                  : null,
            ),
            obscureText: _isObscured,
          ),
        ),
        if (widget.errorMessage != null)
          Text(
            widget.errorMessage ?? ' ',
            style: Topography.caption,
          ),
      ],
    );
  }

  void _changePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  bool isValid() {
    if (widget.errorMessage == null ||
        widget.errorMessage == ' ' ||
        widget.errorMessage == '') {
      return true;
    } else {
      return false;
    }
  }
}
