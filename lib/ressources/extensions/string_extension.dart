import 'package:architect_hub/ressources/enums/request_types.dart';

extension StringExtension on String {
  RequestType get requestTypeToEnum {
    switch (this) {
      case 'قيد المعاينة':
        return RequestType.underReviewRequest;
      case 'قيد التنفيذ':
        return RequestType.inExecutionRequest;
      case 'مكتمل':
        return RequestType.completedRequest;
      case 'مسودة':
        return RequestType.draftRequest;
      default:
        return RequestType.draftRequest;
    }
  }
}
