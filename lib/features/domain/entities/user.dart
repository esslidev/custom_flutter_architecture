import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? thirdPartyId;
  final String? accessToken;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? thirdPartyProvider;
  final String? profilePictureUrl;

  const UserEntity({
    this.id,
    this.thirdPartyId,
    this.accessToken,
    this.email,
    this.firstName,
    this.lastName,
    this.thirdPartyProvider,
    this.profilePictureUrl,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        thirdPartyId,
        accessToken,
        firstName,
        lastName,
        thirdPartyProvider,
        profilePictureUrl,
      ];
}
