import 'package:equatable/equatable.dart';

import './models.dart';

class Checkout extends Equatable {
  const Checkout({
    required this.email,
    required this.fullName,
    required this.address,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.products,
  });

  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final List<Product>? products;

  Checkout copyWith({
    required String? fullName,
    required String? email,
    required String? address,
    required String? city,
    required String? country,
    required String? zipCode,
    required String? subtotal,
    required String? deliveryFee,
    required String? total,
    required List<Product>? products,
  }) {
    return Checkout(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      zipCode: zipCode ?? this.zipCode,
      subtotal: subtotal ?? this.subtotal,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      total: total ?? this.total,
      products: products ?? this.products,
    );
  }

  Map<String, Object> toDocument() {
    Map<String, Object> customerAddress = {};
    customerAddress['address'] = address!;
    customerAddress['city'] = city!;
    customerAddress['country'] = country!;
    customerAddress['zipCode'] = zipCode!;

    return {
      'customerAddress': customerAddress,
      'customerName': fullName!,
      'customerEmail': email!,
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total!,
      'products': products!.map((product) => product.name).toList(),
    };
  }

  @override
  List<Object?> get props => [
        email,
        fullName,
        address,
        city,
        country,
        zipCode,
        subtotal,
        deliveryFee,
        total,
        products,
      ];
}
