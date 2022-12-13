part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadCategory extends CategoryEvent {
  const LoadCategory();

  @override
  List<Object> get props => [];
}

class UpdateCategory extends CategoryEvent {
  const UpdateCategory({required this.categories});

  final List<Category> categories;

  @override
  List<Object> get props => [categories];
}
