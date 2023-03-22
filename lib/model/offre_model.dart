import 'package:architect_hub/model/user_model.dart';

class OffreModel {
  int id;
  int idRequest;
  UserModel user;
  int durationInDays;
  DateTime startDate;
  double price;
  bool isIncludeServices;
  OffreModel({
    required this.id,
    required this.idRequest,
    required this.user,
    required this.durationInDays,
    required this.startDate,
    required this.price,
    required this.isIncludeServices,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'idRequest': idRequest,
      'user': user.toJson(),
      'durationInDays': durationInDays,
      'startDate': startDate.toIso8601String(),
      'price': price,
      'isIncludeServices': isIncludeServices,
    };
  }

  factory OffreModel.fromJson(Map<String, dynamic> map) {
    return OffreModel(
      id: map['id'] as int,
      idRequest: map['idRequest'] as int,
      user: UserModel.fromJson(map['user'] as Map<String, dynamic>),
      durationInDays: map['durationInDays'] as int,
      startDate: DateTime.parse(map['startDate'] as String),
      price: map['price'] as double,
      isIncludeServices: map['isIncludeServices'] as bool,
    );
  }

  static List<OffreModel> listFromJson(dynamic json) => List<OffreModel>.from(
        json.map((model) => OffreModel.fromJson(model)),
      );

  @override
  String toString() {
    return 'OffreModel(id: $id, idRequest: $idRequest, user: $user, durationInDays: $durationInDays, startDate: $startDate, price: $price, isIncludeServices: $isIncludeServices)';
  }

  @override
  bool operator ==(covariant OffreModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.idRequest == idRequest &&
        other.user == user &&
        other.durationInDays == durationInDays &&
        other.startDate == startDate &&
        other.price == price &&
        other.isIncludeServices == isIncludeServices;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idRequest.hashCode ^
        user.hashCode ^
        durationInDays.hashCode ^
        startDate.hashCode ^
        price.hashCode ^
        isIncludeServices.hashCode;
  }
}
