import 'package:architect_hub/model/type_model.dart';

class FilterModel {
  double minRating;
  double price;
  bool isIncludeMaterials;
  String location;
  List<TypeFilterModel> types;
  FilterModel({
    required this.minRating,
    required this.price,
    required this.isIncludeMaterials,
    required this.location,
    required List<TypeModel> availableTypes,
  }) : types = List.generate(
            availableTypes.length,
            (index) => TypeFilterModel(
                isSelected: false, name: availableTypes[index].name));

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'minRating': minRating,
      'price': price,
      'isIncludeMaterials': isIncludeMaterials,
      'location': location,
      'types': types,
    };
  }

  @override
  String toString() {
    return 'FilterModel(minRating: $minRating, price: $price, isIncludeMaterials: $isIncludeMaterials, location: $location, types: $types)';
  }
}

class TypeFilterModel extends TypeModel {
  bool isSelected;
  TypeFilterModel({required this.isSelected, required super.name});

  @override
  bool operator ==(covariant TypeFilterModel other) {
    return name == other.name;
  }

  @override
  int get hashCode => name.hashCode;
}
