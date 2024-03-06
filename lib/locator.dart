import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/util/localization_service.dart';
import 'features/data/data_sources/remote/user_api_service.dart';
import 'features/data/repository/user_repository_empl.dart';
import 'features/domain/repository/user_repository.dart';
import 'features/domain/usecases/user_usecases.dart';
import 'features/presentation/bloc/remote/user/user_bloc.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Controllers

  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  // LocalizationService
  Locale systemLocale = WidgetsBinding.instance.platformDispatcher.locale;
  LocalizationService localizationService =
      await LocalizationService.load(systemLocale);
  locator.registerSingleton<LocalizationService>(localizationService);

  // Dio
  locator.registerSingleton<Dio>(Dio());

  //Blocs
  locator.registerFactory<RemoteUserBloc>(() => RemoteUserBloc(locator()));

  // Dependencies
  locator.registerSingleton<UserApiService>(UserApiService(locator()));
  locator.registerSingleton<UserRepository>(UserRepositoryImpl(locator()));

  //UseCases
  locator.registerSingleton<UserUseCases>(UserUseCases(locator()));
}
