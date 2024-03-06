import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../../models/data_response_model.dart';
import '../../models/user_model.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class UserApiService {
  factory UserApiService(Dio dio) = _UserApiService;

  // Method to get a user by third party ID.
  @GET('/api/users/getUser')
  Future<HttpResponse<UserModel>> getUser({
    @Header("apiKey") required String apiKey,
    @Query("thirdPartyId") required String thirdPartyId,
    @Query("accessToken") required String accessToken,
  });

  // Method to set a user.
  @POST("/api/users/setUser")
  Future<HttpResponse<DataResponseModel>> setUser({
    @Header("apiKey") required String apiKey,
    @Body() required UserModel user,
    @Header('Content-Type') String contentType = 'application/json',
  });

  // Method to set a user.
  @PUT("/api/users/updateUser")
  Future<HttpResponse<UserModel>> updateUser({
    @Header("apiKey") required String apiKey,
    @Body() required UserModel user,
    @Header('Content-Type') String contentType = 'application/json',
  });
}
