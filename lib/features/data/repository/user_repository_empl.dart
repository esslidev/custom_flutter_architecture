import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/constants/api_constants.dart';
import '../../../core/resources/data_state.dart';
import '../../domain/entities/user.dart';
import '../../domain/repository/user_repository.dart';
import '../data_sources/remote/user_api_service.dart';
import '../models/data_response_model.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService _userApiService;

  UserRepositoryImpl(this._userApiService);

  @override
  Future<DataState<UserModel>> getUser(
      String thirdPartyId, String accessToken) async {
    try {
      final httpResponse = await _userApiService.getUser(
        apiKey: apiKey,
        thirdPartyId: thirdPartyId,
        accessToken: accessToken,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<DataResponseModel>> setUser(UserModel user) async {
    try {
      final httpResponse = await _userApiService.setUser(
        apiKey: apiKey,
        user: user,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<UserEntity>> updateUser(UserModel user) async {
    try {
      final httpResponse = await _userApiService.updateUser(
        apiKey: apiKey,
        user: user,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
