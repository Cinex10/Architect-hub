class TypeModel {
  final String name;

  const TypeModel({
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory TypeModel.fromJson(Map<String, dynamic> map) {
    return TypeModel(
      name: map['name'] as String,
    );
  }

  @override
  String toString() => 'TypeModel(name: $name)';

  @override
  bool operator ==(covariant TypeModel other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
