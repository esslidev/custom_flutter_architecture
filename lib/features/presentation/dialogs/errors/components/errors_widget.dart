import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/util/localization_service.dart';
import '../../../../../core/util/responsive_size_adapter.dart';

class ErrorsWidget extends StatefulWidget {
  final String? statusCode;
  final String? error;
  final String? errorMessage;
  final LocalizationService localizationService;
  final VoidCallback onPressed;

  const ErrorsWidget(
      {super.key,
      this.statusCode,
      this.error,
      this.errorMessage,
      required this.localizationService, required this.onPressed});

  @override
  State<ErrorsWidget> createState() => _ErrorsWidgetState();
}

class _ErrorsWidgetState extends State<ErrorsWidget> {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final Size screenSize = MediaQuery.of(context).size;
    // responsive px adapter
    final ResponsiveSizeAdapter R = ResponsiveSizeAdapter(context);
    // background controller locator

    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 25.0),
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            color: AppColors.subtleColor,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             //...
            ],
          ),
        )
      ],
    );
  }
}
