import 'package:architect_hub/ressources/enums/request_types.dart';
import 'package:flutter/foundation.dart';

extension RequestTypeExtension on RequestType {
  String get name => describeEnum(this);
  String get requestTypeToString {
    switch (this) {
      case RequestType.underReviewRequest:
        return 'قيد المعاينة';
      case RequestType.inExecutionRequest:
        return 'قيد التنفيذ';
      case RequestType.completedRequest:
        return 'مكتمل';
      case RequestType.draftRequest:
        return 'مسودة';
      default:
        return 'مسودة';
    }
  }
}
