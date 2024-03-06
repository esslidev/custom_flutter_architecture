import '../../../core/resources/data_state.dart';
import '../../data/models/user_model.dart';
import '../entities/dataResponse.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<DataState<UserEntity>> getUser(
      String thirdPartyId, String accessToken);

  Future<DataState<DataResponseEntity>> setUser(UserModel user);

  Future<DataState<UserEntity>> updateUser(UserModel user);

}
