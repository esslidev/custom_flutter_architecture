import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/util/responsive_size_adapter.dart';

class BusyWidget extends StatelessWidget {
  final String title;
  final String text;

  const BusyWidget(
      {super.key, this.text = 'Empty...', this.title = 'Busy task...'});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final Size screenSize = MediaQuery.of(context).size;
    // responsive px adapter
    final ResponsiveSizeAdapter R = ResponsiveSizeAdapter(context);

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
            //....
            ],
          ),
        )
      ],
    );
  }
}
