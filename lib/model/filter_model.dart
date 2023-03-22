class FilterModel {
  double minRating;
  double price;
  bool isIncludeMaterials;
  String location;
  List<String> selectedTypes;
  FilterModel({
    required this.minRating,
    required this.price,
    required this.isIncludeMaterials,
    required this.location,
    required this.selectedTypes,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'minRating': minRating,
      'price': price,
      'isIncludeMaterials': isIncludeMaterials,
      'location': location,
      'selectedTypes': selectedTypes,
    };
  }

  @override
  String toString() {
    return 'FilterModel(minRating: $minRating, price: $price, isIncludeMaterials: $isIncludeMaterials, location: $location, selectedTypes: $selectedTypes)';
  }
}
