import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel({
    String? id,
    String? email,
    String? thirdPartyId,
    String? accessToken,
    String? firstName,
    String? lastName,
    String? thirdPartyProvider,
    String? profilePictureUrl,
  }) : super(
            id: id,
            email: email,
            thirdPartyId: thirdPartyId,
            accessToken: accessToken,
            firstName: firstName,
            lastName: lastName,
            thirdPartyProvider: thirdPartyProvider,
            profilePictureUrl: profilePictureUrl,);

  // Convert JSON into model
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
        id: map['id'],
        email: map['email'],
        thirdPartyId: map['thirdPartyId'],
        accessToken: map['accessToken'],
        firstName: map['firstName'],
        lastName: map['lastName'],
        thirdPartyProvider: map['thirdPartyProvider'],
        profilePictureUrl: map['profilePictureUrl'],);
  }

  // Convert the model into JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'thirdPartyId': thirdPartyId,
      'accessToken': accessToken,
      'firstName': firstName,
      'lastName': lastName,
      'thirdPartyProvider': thirdPartyProvider,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}
