import 'package:fintech/config/themes/app_text_theme.dart';
import 'package:fintech/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double btnWidth;
  final double btnHeight;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  const CustomTextButtonWidget({
    super.key,
    required this.text,
    required this.btnWidth,
    required this.btnHeight,
    this.style,
    this.textStyle,
    required this.onPressed,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: btnWidth,
      height: btnHeight,
      child: TextButton(
        onPressed: onPressed,
        style: style ?? Theme.of(context).textButtonTheme.style,
        child: CustomTextWidget(
          text: text,
          textAlign: textAlign ?? TextAlign.center,
          textStyle: textStyle ?? AppTextTheme.bodyMedium,
        ),
      ),
    );
  }
}
