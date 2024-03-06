import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/dataResponse.dart';
import '../../../../domain/entities/user.dart';

abstract class RemoteUserState extends Equatable {
  final UserEntity? user;
  final DataResponseEntity? response;
  final DioException? error;

  const RemoteUserState({this.user, this.error, this.response});

  @override
  List<Object> get props => [user ?? '', response ?? '', error ?? ''];
}

// init user
class RemoteUserInitial extends RemoteUserState {
  const RemoteUserInitial();
}

// loading user
class RemoteUserLoading extends RemoteUserState {
  const RemoteUserLoading();
}

class RemoteUserLoaded extends RemoteUserState {
  const RemoteUserLoaded(UserEntity? user) : super(user: user);
}

// saving user
class RemoteUserSaving extends RemoteUserState {
  const RemoteUserSaving();
}

class RemoteUserSaved extends RemoteUserState {
  const RemoteUserSaved(DataResponseEntity? response)
      : super(response: response);
}

// updating user
class RemoteUserUpdating extends RemoteUserState {
  const RemoteUserUpdating();
}

class RemoteUserUpdated extends RemoteUserState {
  const RemoteUserUpdated(UserEntity? user) : super(user: user);
}

class RemoteUserError extends RemoteUserState {
  const RemoteUserError(DioException? error) : super(error: error);
}
