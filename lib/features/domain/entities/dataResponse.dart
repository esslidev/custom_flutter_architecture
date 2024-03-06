import 'package:equatable/equatable.dart';

class DataResponseEntity extends Equatable {
  final bool? success;
  final String message;

  const DataResponseEntity({
    this.success,
    required this.message,
  });

  @override
  List<Object?> get props => [success, message];
}
