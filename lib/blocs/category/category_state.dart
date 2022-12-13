part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {
  const CategoryLoading();

  @override
  List<Object> get props => [];
}

class CategoryLoaded extends CategoryState {
  const CategoryLoaded({this.categories = const <Category>[]});

  final List<Category> categories;

  @override
  List<Object> get props => [categories];
}
