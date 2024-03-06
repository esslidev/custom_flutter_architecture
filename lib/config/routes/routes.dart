import 'package:flutter/material.dart';

import '../../features/presentation/pages/login/login.dart';
import '../../features/presentation/pages/router/bad_routing.dart';
import '../../features/presentation/pages/router/router.dart';

class AppRoutes {
  static const String routerPage = '/RouterPage';
  static const String loginPage = '/LoginPage';

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case routerPage:
        return _fadeInRoute(const RouterPage(), settings: settings);
      case loginPage:
        return _fadeInRoute(const Login(), settings: settings);

      default:
        return _fadeInRoute(const BadRouting(), settings: settings);
    }
  }

  static Route<dynamic> _fadeInRoute(Widget view, {RouteSettings? settings}) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
        opacity: animation,
        child: view,
      ),
      transitionDuration: const Duration(milliseconds: 200),
    );
  }
}
