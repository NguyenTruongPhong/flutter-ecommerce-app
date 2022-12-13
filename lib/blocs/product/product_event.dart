part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProduct extends ProductEvent {
  const LoadProduct();

  @override
  List<Object> get props => [];
}

class UpdateProduct extends ProductEvent {
  const UpdateProduct({required this.products});

  final List<Product> products;

  @override
  List<Object> get props => [products];
}
