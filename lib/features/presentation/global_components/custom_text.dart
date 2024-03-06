import 'package:flutter/cupertino.dart';

import '../../../config/theme/app_themes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/util/responsive_size_adapter.dart';

class CustomText extends StatefulWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  const CustomText(
      {super.key,
      required this.text,
      this.fontSize,
      this.backgroundColor,
      this.foregroundColor,
      this.padding,
      this.borderRadius,
      this.fontWeight});

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    final ResponsiveSizeAdapter R = ResponsiveSizeAdapter(context);

    return IntrinsicWidth(
      child: Container(
        padding: widget.padding ??
            EdgeInsets.symmetric(vertical: R.size(10), horizontal: R.size(20)),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? AppColors.redColor,
          borderRadius: widget.borderRadius ??
              BorderRadius.circular(R.size(5)), // Adjust the radius as needed
        ),
        child: Center(
          child: Text(
            widget.text,
            style: AppThemes.bodyText.copyWith(
                color: widget.foregroundColor,
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight ?? FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
