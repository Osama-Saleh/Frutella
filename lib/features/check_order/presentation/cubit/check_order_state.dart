part of 'check_order_cubit.dart';
class CheckOrderState {
  final String name;
  final String email;
  final String address;
  final String city;
  final String apartment;
  final String phone;

  const CheckOrderState({
    this.name = '',
    this.email = '',
    this.address = '',
    this.city = '',
    this.apartment = '',
    this.phone = '',
  });

  CheckOrderState copyWith({
    String? name,
    String? email,
    String? address,
    String? city,
    String? apartment,
    String? phone,
  }) {
    return CheckOrderState(
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
      apartment: apartment ?? this.apartment,
      phone: phone ?? this.phone,
    );
  }
}

