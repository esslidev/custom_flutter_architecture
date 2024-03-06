import 'package:flutter/material.dart';

import '../../../../core/util/localization_service.dart';
import 'components/errors_widget.dart';

class ErrorsDialog {
  static void show({required BuildContext context,
    required LocalizationService localizationService,
    required VoidCallback onPressed,
    String? statusCode,
    String? error,
    String? errorMessage}) {
    try {
      showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {

          return PopScope(
            canPop: false,
            child: ErrorsWidget(
                statusCode: statusCode,
                error: error,
                errorMessage: errorMessage,
                localizationService: localizationService,
                onPressed: onPressed,
          ),);
        },
      );
    } catch (e) {
      print('Error showing ErrorsDialog: $e');
    }
  }
}
