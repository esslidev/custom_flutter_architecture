import '../../domain/entities/dataResponse.dart';

class DataResponseModel extends DataResponseEntity {
  const DataResponseModel({
    bool? success,
    required String message,
  }) : super(success: success, message: message);

  factory DataResponseModel.fromJson(Map<String, dynamic> json) {
    return DataResponseModel(
      success: json['success'],
      message: json['status'] ?? '',
    );
  }
}
