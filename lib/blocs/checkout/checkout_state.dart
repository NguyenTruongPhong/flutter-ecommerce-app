part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

class CheckoutLoading extends CheckoutState {
  const CheckoutLoading();

  @override
  List<Object> get props => [];
}

class CheckoutLoaded extends CheckoutState {
  const CheckoutLoaded({required this.checkout});

  final Checkout checkout;

  @override
  List<Object> get props => [checkout];
}

class CheckoutSucceeded extends CheckoutState {
  const CheckoutSucceeded();

  @override
  List<Object> get props => [];
}


