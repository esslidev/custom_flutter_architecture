import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/routes/routes.dart';
import 'config/theme/app_themes.dart';
import 'features/presentation/bloc/remote/user/user_bloc.dart';
import 'firebase_options.dart';
import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Perform setup and initialization
  await setupLocator();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Restrict the app to portrait mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Run the app after setup is complete
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.themeData,
      supportedLocales: const [
        Locale('en', 'US'), // English (US) main
        Locale('en', 'UK'), // English (UK)
        Locale('de', 'DE'), // German
        Locale('fr', 'FR'), // French
        // add more locales as needed
      ],
      localizationsDelegates: const [
        // Add the following delegates
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // ...
      ],
      locale: WidgetsBinding.instance.platformDispatcher.locale,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<RemoteUserBloc>(
              create: (context) => locator<RemoteUserBloc>()),
        ],
        child: const Scaffold(
          body: Navigator(
            onGenerateRoute: AppRoutes.onGenerateRoutes,
            initialRoute: AppRoutes.routerPage,
          ),
        ),
      ),
    );
  }
}
