import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karim_flutter_task/features/offers_feature/data/model/sub_category_model.dart';
import 'package:karim_flutter_task/features/offers_feature/data/repo/sub_category_repository.dart';

// States
sealed class SubCategoryState {}

class SubCategoryInitial extends SubCategoryState {}

class SubCategoryLoading extends SubCategoryState {}

class SubCategoryLoaded extends SubCategoryState {
  final List<SubCategoryModel> subCategories;
  final int selectedSubCategoryIndex;

  SubCategoryLoaded({
    required this.subCategories,
    this.selectedSubCategoryIndex = 0,
  });

  SubCategoryLoaded copyWith({
    List<SubCategoryModel>? subCategories,
    int? selectedSubCategoryIndex,
  }) {
    return SubCategoryLoaded(
      subCategories: subCategories ?? this.subCategories,
      selectedSubCategoryIndex: selectedSubCategoryIndex ?? this.selectedSubCategoryIndex,
    );
  }
}

class SubCategoryError extends SubCategoryState {
  final String message;

  SubCategoryError({required this.message});
}

// Cubit
class SubCategoryCubit extends Cubit<SubCategoryState> {
  final SubCategoryRepository _subCategoryRepository;

  SubCategoryCubit({required SubCategoryRepository subCategoryRepository})
      : _subCategoryRepository = subCategoryRepository,
        super(SubCategoryInitial());

  Future<void> loadSubCategories() async {
    emit(SubCategoryLoading());
    try {
      await _subCategoryRepository.initializeSampleSubCategories();
      final subCategories = await _subCategoryRepository.getAllSubCategories();
      emit(SubCategoryLoaded(subCategories: subCategories));
    } catch (e) {
      emit(SubCategoryError(message: e.toString()));
    }
  }

  void selectSubCategory(int index) {
    final currentState = state;
    if (currentState is SubCategoryLoaded) {
      emit(currentState.copyWith(selectedSubCategoryIndex: index));
    }
  }

  void refreshSubCategories() {
    loadSubCategories();
  }

  SubCategoryModel? getSubCategoryByIndex(int index) {
    final currentState = state;
    if (currentState is SubCategoryLoaded && 
        index >= 0 && 
        index < currentState.subCategories.length) {
      return currentState.subCategories[index];
    }
    return null;
  }
}
