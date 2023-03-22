import 'package:architect_hub/ressources/enums/property_type.dart';
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

  PropertyType get propertyTypeToEnum {
    switch (this) {
      case 'فيلا':
        return PropertyType.villa;
      case 'شقة':
        return PropertyType.apartement;
      case 'مكتب':
        return PropertyType.offices;
      case 'متجر':
        return PropertyType.shop;
      case 'عيادة':
        return PropertyType.medical;
      default:
        return PropertyType.villa;
    }
  }
}
