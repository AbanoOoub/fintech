import 'package:flutter/material.dart';
import '../config/themes/app_text_theme.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {super.key,
      required this.text,
      this.maxLines,
      this.textAlign,
      this.textStyle,
      this.fontSize,
      this.textColor,
      this.textWeight});

  final String text;
  final int? maxLines;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final Color? textColor;
  final FontWeight? textWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 2,
      textAlign: textAlign ?? TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: textStyle != null
          ? textStyle!.copyWith(color: textColor, fontWeight: textWeight, fontSize: fontSize)
          : AppTextTheme.bodyMedium
              .copyWith(color: textColor, fontWeight: textWeight, fontSize: fontSize),
    );
  }
}
