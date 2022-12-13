import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/checkout/base_checkout_repository.dart';

import '../../models/models.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc({required BaseCheckoutRepository checkoutRepository})
      : _checkoutRepository = checkoutRepository,
        super(const CheckoutLoading()) {
    on<UpdateCheckout>(_onUpdateCheckout);
    on<ConfirmCheckout>(_onConfirmCheckout);
  }

  final BaseCheckoutRepository _checkoutRepository;

  void _onUpdateCheckout(UpdateCheckout event, Emitter<CheckoutState> emit) {
    final state = this.state;

    if (state is CheckoutLoading || state is CheckoutSucceeded) {
      final Checkout checkout = Checkout(
        fullName: event.fullName,
        email: event.email,
        address: event.address,
        city: event.city,
        country: event.country,
        zipCode: event.zipCode,
        subtotal: event.cart?.subTotalString,
        deliveryFee: event.cart?.deliveryFeeString,
        total: event.cart?.totalString,
        products: event.cart?.products,
      );
      emit(CheckoutLoaded(checkout: checkout));
    }

    if (state is CheckoutLoaded) {
      emit(
        CheckoutLoaded(
          checkout: state.checkout.copyWith(
            fullName: event.fullName,
            email: event.email,
            address: event.address,
            city: event.city,
            country: event.country,
            zipCode: event.zipCode,
            subtotal: event.cart?.subTotalString,
            deliveryFee: event.cart?.deliveryFeeString,
            total: event.cart?.totalString,
            products: event.cart?.products,
          ),
        ),
      );
    }
  }

  void _onConfirmCheckout(
      ConfirmCheckout event, Emitter<CheckoutState> emit) async {
    final state = this.state;
    if (state is CheckoutLoaded) {
      try {
        emit(const CheckoutLoading());
        await _checkoutRepository.addCheckout(event.checkout);
        emit(const CheckoutSucceeded());
      } catch (_) {}
    }
  }
}
