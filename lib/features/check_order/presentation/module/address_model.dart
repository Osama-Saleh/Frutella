import 'package:fruit/features/check_order/presentation/module/check_order_address_model.dart';

class AddressModel {
  String name;
  String mail;
  String adress;
  String city;
  String adressDetails;
  String phone;
  AddressModel({
    required this.name,
    required this.mail,
    required this.adress,
    required this.city,
    required this.adressDetails,
    required this.phone,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      name: json['name'],
      mail: json['mail'],
      adress: json['adress'],
      city: json['city'],
      adressDetails: json['adressDetails'],
      phone: json['phone'],
    );
  }
  factory AddressModel.fromEntity(CheckOrderAddressEntity entity) {
    return AddressModel(
      name: entity.name,
      mail: entity.mail,
      adress: entity.adress,
      city: entity.city,
      adressDetails: entity.adressDetails,
      phone: entity.phone,
    );
  }

  toJson() {
    return {
      'name': name,
      'mail': mail,
      'adress': adress,
      'city': city,
      'adressDetails': adressDetails,
      'phone': phone,
    };
  }
}
