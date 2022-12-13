
part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {
  const ProductLoading();

  @override
  List<Object> get props => [];
}

class ProductLoaded extends ProductState {
  const ProductLoaded({this.products = const <Product>[]});

  final List<Product> products;

  @override
  List<Object> get props => [products];
}
