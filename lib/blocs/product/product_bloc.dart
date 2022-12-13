import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/product/base_product_repository.dart';

import '../../models/models.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required BaseProductRepository productRepository})
      : _productRepository = productRepository,
        super(const ProductLoading()) {
    on<LoadProduct>(_onLoadProduct);
    on<UpdateProduct>(_onUpdateProduct);
  }

  final BaseProductRepository _productRepository;
  StreamSubscription? _productStreamSubscription;

  void _onLoadProduct(LoadProduct event, Emitter<ProductState> emit) async {
    // print('onLoadedProduct be called');
    _productStreamSubscription?.cancel();
    emit(const ProductLoading());
    try {
      _productStreamSubscription =
          _productRepository.getAllProducts().listen((products) {
        add(
          UpdateProduct(
            products: List.from(products),
          ),
        );
      });
    } catch (_) {}
  }

  void _onUpdateProduct(UpdateProduct event, Emitter<ProductState> emit) async {
    emit(ProductLoaded(products: List.from(event.products)));
  }
}
