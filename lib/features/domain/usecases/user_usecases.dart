import '../../../core/resources/data_state.dart';
import '../../data/models/user_model.dart';
import '../entities/dataResponse.dart';
import '../entities/user.dart';
import '../repository/user_repository.dart';

class UserUseCases {
  final UserRepository repository;

  UserUseCases(this.repository);

  Future<DataState<UserEntity>> getUser(
      String thirdPartyId, String accessToken) async {
    return await repository.getUser(thirdPartyId, accessToken);
  }

  Future<DataState<DataResponseEntity>> setUser(UserModel user) async {
    return await repository.setUser(user);
  }

  Future<DataState<UserEntity>> updateUser(UserModel user) async {
    return await repository.updateUser(user);
  }
}
