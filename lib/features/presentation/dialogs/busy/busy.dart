import 'package:flutter/material.dart';

import 'components/busy_widget.dart';

class BusyDialog {
  static void show({
    required BuildContext context,
    required String title,
    required String text,
  }) {
    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return PopScope(
            canPop: false,
            child: BusyWidget(title: title, text: text),
          );
        });
  }

  static void close(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
