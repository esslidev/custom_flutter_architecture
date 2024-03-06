import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/constants/shared_preference_keys.dart';
import '../../../../core/util/localization_service.dart';
import '../../../../locator.dart';
import '../../dialogs/busy/busy.dart';

class RouterPage extends StatefulWidget {
  const RouterPage({super.key});

  @override
  State<RouterPage> createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {
  // for multi languages
  LocalizationService localizationService = locator<LocalizationService>();
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _route();
  }

  Future<void> _route() async {
    _prefs = await SharedPreferences.getInstance();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BusyDialog.show(
        context: context,
        title: localizationService.translate('busyWidget.routerLoading.title'),
        text: localizationService.translate('busyWidget.routerLoading.text'),
      );
      if (!_prefs.containsKey(SharedPreferenceKeys.isUserCreated) ||
          _prefs.getBool(SharedPreferenceKeys.isUserCreated)!) {
        BusyDialog.close(context);
        // Navigator.pushReplacementNamed(context, AppRoutes.homePage);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.loginPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
