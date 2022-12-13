import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/category/base_category_repository.dart';
import '../../models/models.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required BaseCategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(const CategoryLoading()) {
    on<LoadCategory>(_onLoadCategory);
    on<UpdateCategory>(_onUpdateCategory);
  }

  final BaseCategoryRepository _categoryRepository;
  StreamSubscription? _categoryStreamSubscription;

  void _onLoadCategory(LoadCategory event, Emitter<CategoryState> emit) async {
    _categoryStreamSubscription?.cancel();
    emit(const CategoryLoading());
    try {
      _categoryStreamSubscription =
          _categoryRepository.getAllCategories().listen((categories) {
        add(
          UpdateCategory(
            categories: List.from(categories),
          ),
        );
      });
    } catch (_) {}
  }

  void _onUpdateCategory(
      UpdateCategory event, Emitter<CategoryState> emit) async {
    emit(CategoryLoaded(categories: List.from(event.categories)));
  }

  @override
  Future<void> close() {
    _categoryStreamSubscription?.cancel();
    return super.close();
  }
}
