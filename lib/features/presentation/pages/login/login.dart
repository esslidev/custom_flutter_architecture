import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/constants/shared_preference_keys.dart';
import '../../../../core/util/localization_service.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../../../../locator.dart';
import '../../../data/models/user_model.dart';
import '../../bloc/remote/user/user_bloc.dart';
import '../../bloc/remote/user/user_event.dart';
import '../../bloc/remote/user/user_state.dart';
import '../../dialogs/busy/busy.dart';
import '../../dialogs/errors/errors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // for multi languages
  LocalizationService localizationService = locator<LocalizationService>();

  late SharedPreferences _prefs;

  //for triggering the closing screen animation

  String userThirdPartyId = '';
  String userAccessToken = '';
  bool closeScreenAnimate = false;

  @override
  void initState() {
    super.initState();
    _prefs = locator<SharedPreferences>();
  }

  //bloc events
  void setUser(UserModel user) {
    context.read<RemoteUserBloc>().add(SetUser(user));
  }

  //firebase auth
  Future<UserCredential> signInWithGoogle() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      throw {
        "title": localizationService.translate('errors.networkError.title'),
        "message": localizationService.translate('errors.networkError.message'),
      };
    } else {
      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        if (googleUser == null) {
          throw {
            "title":
                localizationService.translate('errors.googleSignInError.title'),
            "message": localizationService
                .translate('errors.googleSignInError.message'),
          };
        }

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        return await FirebaseAuth.instance.signInWithCredential(credential);
      } catch (e) {
        print("Error: $e");

        throw {
          "title":
              localizationService.translate('errors.connectivityError.title'),
          "message":
              localizationService.translate('errors.connectivityError.message'),
        };
      }
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      throw {
        "title": localizationService.translate('errors.networkError.title'),
        "message": localizationService.translate('errors.networkError.message'),
      };
    } else {
      try {
        // Trigger the sign-in flow
        final LoginResult loginResult = await FacebookAuth.instance.login();

        // Create a credential from the access token
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);

        // Once signed in, return the UserCredential
        return await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
      } catch (e) {
        print("Error: $e");

        throw {
          "title":
              localizationService.translate('errors.connectivityError.title'),
          "message":
              localizationService.translate('errors.connectivityError.message'),
        };
      }
    }
  }

  void _onHomeNavigate(BuildContext context, String userThirdPartyId,
      String userAccessToken, bool isUserCreated) {
    _prefs.setString(SharedPreferenceKeys.userThirdPartyId, userThirdPartyId);
    _prefs.setString(SharedPreferenceKeys.userAccessToken, userAccessToken);

    closeScreenAnimate = true;

    Future.delayed((1500.ms), () {
      Navigator.pushReplacementNamed(context, AppRoutes.loginPage, arguments: {
        'thirdPartyId': userThirdPartyId,
        'accessToken': userAccessToken,
        'isUserCreated': isUserCreated
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // responsive px adapter
    final ResponsiveSizeAdapter R = ResponsiveSizeAdapter(context);

    return Scaffold(
      body: BlocListener<RemoteUserBloc, RemoteUserState>(
        listener: (context, state) {
          if (state is RemoteUserSaving) {
            BusyDialog.show(
                context: context,
                title: localizationService.translate('busyWidget.signIn.title'),
                text: localizationService.translate('busyWidget.signIn.text'));
          }
          if (state is RemoteUserSaved) {
            _onHomeNavigate(context, userThirdPartyId, userAccessToken,
                state.response!.message == "Created");
            BusyDialog.close(context);
          }
          if (state is RemoteUserError) {
            BusyDialog.close(context);
            ErrorsDialog.show(
                context: context,
                localizationService: localizationService,
                statusCode: state.error?.response?.statusCode.toString(),
                error: state.error?.response?.data["error"],
                errorMessage: state.error?.response?.data["message"], onPressed: () {  });
          }
        },
        child: Stack(
          children: [
            //...
          ],
        ),
      ),
    );
  }
}
