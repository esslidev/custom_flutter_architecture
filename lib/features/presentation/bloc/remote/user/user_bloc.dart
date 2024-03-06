import 'package:custom_flutter_architecture/features/presentation/bloc/remote/user/user_event.dart';
import 'package:custom_flutter_architecture/features/presentation/bloc/remote/user/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../domain/usecases/user_usecases.dart';

class RemoteUserBloc extends Bloc<RemoteUserEvent, RemoteUserState> {
  final UserUseCases _userUseCases;

  RemoteUserBloc(this._userUseCases) : super(const RemoteUserInitial()) {
    on<GetUser>(onGetUser);
    on<SetUser>(onSetUser);
    on<UpdateUser>(onUpdateUser);
  }

  void onGetUser(GetUser event, Emitter<RemoteUserState> emit) async {
    emit(const RemoteUserLoading());
    final dataState =
        await _userUseCases.getUser(event.thirdPartyId, event.accessToken);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(RemoteUserLoaded(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteUserError(dataState.error!));
    }
  }

  void onSetUser(SetUser event, Emitter<RemoteUserState> emit) async {
    emit(const RemoteUserSaving());
    final dataState = await _userUseCases.setUser(event.user);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(RemoteUserSaved(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteUserError(dataState.error!));
    }
  }

  void onUpdateUser(UpdateUser event, Emitter<RemoteUserState> emit) async {
    emit(const RemoteUserUpdating());
    final dataState = await _userUseCases.updateUser(event.user);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(RemoteUserUpdated(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteUserError(dataState.error!));
    }
  }
}
