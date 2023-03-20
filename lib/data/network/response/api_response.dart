import 'package:architect_hub/ressources/enums/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse({
    this.status,
    this.data,
    this.message,
  });

  ApiResponse.loading() : status = Status.loading;
  ApiResponse.error() : status = Status.error;
  ApiResponse.completed() : status = Status.completed;

  @override
  String toString() {
    return '-status : $status\n-message: $message\n-data: $data';
  }
}
