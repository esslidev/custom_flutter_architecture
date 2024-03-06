import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/util/responsive_size_adapter.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final double? height;
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final Gradient? gradient;
  final TextStyle? textStyle;
  final String? iconImagePath;
  final String? iconVectorPath;
  final Offset? iconSize;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.direction,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.gradient,
    this.textStyle,
    this.iconImagePath,
    this.iconVectorPath,
    this.iconSize,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final ResponsiveSizeAdapter R = ResponsiveSizeAdapter(context);

    Widget content = Flex(
      direction: widget.direction ?? Axis.horizontal,
      mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.center,
      crossAxisAlignment:
          widget.crossAxisAlignment ?? CrossAxisAlignment.center,
      children: _buildChildren(R),
    );

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        gradient: widget.gradient,
        borderRadius: BorderRadius.circular(R.size(10)),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: ElevatedButton(
            onPressed: () {
              widget.onPressed();
            },
            style: ElevatedButton.styleFrom(
              foregroundColor:
                  widget.foregroundColor ?? AppColors.redColor,
              backgroundColor:
                  widget.backgroundColor ?? AppColors.redColor,
              elevation: 0,
              padding: R.padding(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(R.size(10)),
              ),
            ),
            child: content,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildChildren(ResponsiveSizeAdapter R) {
    List<Widget> children = [];

    if (widget.iconImagePath != null) {
      children.add(
        Image.asset(
          widget.iconImagePath!,
          width: widget.iconSize?.dx ?? R.size(50),
          height: widget.iconSize?.dy ?? R.size(50),
        ),
      );
    }

    if (widget.iconVectorPath != null) {
      children.add(
        SvgPicture.asset(
          widget.iconVectorPath!,
          width: widget.iconSize?.dx ?? R.size(50),
          height: widget.iconSize?.dy ?? R.size(50),
        ),
      );
    }

    if (widget.iconImagePath != null || widget.iconVectorPath != null) {
      if (widget.direction == Axis.vertical) {
        children.add(SizedBox(height: R.size(25)));
      } else {
        children.add(SizedBox(width: R.size(25)));
      }
    }

    children.add(
      Flexible(child: Text(widget.text, maxLines: 1, style: widget.textStyle)),
    );

    return children;
  }
}
