import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karim_flutter_task/features/offers_feature/data/model/category_model.dart';
import 'package:karim_flutter_task/features/offers_feature/data/repo/category_reopsitory.dart';


// States
sealed class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryModel> categories;
  final int selectedCategoryIndex;

  CategoryLoaded({required this.categories, this.selectedCategoryIndex = 0});
}


class CategoryError extends CategoryState {
  final String message;

  CategoryError({required this.message});
}

// Cubit
class CategoryCubit extends Cubit<CategoryState> {
  final CategoryReopsitory _categoryRepository;

  CategoryCubit({required CategoryReopsitory categoryReopsitory})
    : _categoryRepository = categoryReopsitory,
      super(CategoryInitial());

  // Load all categories
  Future<void> loadCategories() async {
    emit(CategoryLoading());
    try {
      // Initialize sample categories if needed
      await Future.delayed(const Duration(seconds: 3));
      await _categoryRepository.initializeSampleCategories();
      final categories = await _categoryRepository.getAllCategories();

      if (categories.isEmpty) {
        emit(CategoryError(message: 'No categories found'));
      } else {
        emit(CategoryLoaded(categories: categories));
      }
    } catch (e) {
      emit(
        CategoryError(message: 'Failed to load categories: ${e.toString()}'),
      );
    }
  }

  // Select a category
  void selectCategory(int index) {
    final currentState = state;
    if (currentState is CategoryLoaded) {
      emit(
        CategoryLoaded(
          categories: currentState.categories,
          selectedCategoryIndex: index,
        ),
      );
    }
  }

  // Refresh categories
  Future<void> refreshCategories() async {
    await loadCategories();
  }

  // Get category by index
  CategoryModel? getCategoryByIndex(int index) {
    final currentState = state;
    if (currentState is CategoryLoaded) {
      if (index >= 0 && index < currentState.categories.length) {
        return currentState.categories[index];
      }
    }
    return null;
  }
}
