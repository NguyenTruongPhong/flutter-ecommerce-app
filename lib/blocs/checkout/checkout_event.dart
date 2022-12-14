// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckout extends CheckoutEvent {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final Cart? cart;

  const UpdateCheckout({
    this.fullName,
    this.email,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.cart,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        country,
        zipCode,
        cart,
      ];
}

class ConfirmCheckout extends CheckoutEvent {
  const ConfirmCheckout({
    required this.checkout,
  });

  final Checkout checkout;

   @override
  List<Object?> get props => [checkout];
}
