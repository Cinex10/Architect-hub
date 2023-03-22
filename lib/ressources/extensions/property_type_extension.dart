import 'package:architect_hub/ressources/enums/property_type.dart';
import 'package:flutter/foundation.dart';

extension PropertyTypeExtension on PropertyType {
  String get name => describeEnum(this);
  String get propertyTypeToString {
    switch (this) {
      case PropertyType.villa:
        return 'فيلا';
      case PropertyType.apartement:
        return 'شقة';
      case PropertyType.offices:
        return 'مكتب';
      case PropertyType.shop:
        return 'متجر';
      case PropertyType.medical:
        return 'عيادة';
      default:
        return 'فيلا';
    }
  }
}
