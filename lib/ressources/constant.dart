import 'package:architect_hub/model/type_model.dart';

class AppConstants {
  static List<TypeModel> availableTypes = [
    const TypeModel(name: 'فيلا'),
    const TypeModel(name: 'شقة'),
    const TypeModel(name: 'مكتب'),
    const TypeModel(name: 'متجر'),
  ];

  static List<String> requestTypes = [
    'الكل',
    'قيد المعاينة',
    'قيد التنفيذ',
    'مكتمل',
    'مسودة',
  ];

  static List<String> unitType = [
    'وحدة 1',
    'وحدة 2',
    'وحدة 3',
    'وحدة 4',
    'وحدة 5',
  ];
}
