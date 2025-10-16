import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karim_flutter_task/features/offers_feature/presentation/cubit/category_cubit.dart';
import 'package:karim_flutter_task/features/offers_feature/presentation/view/components/chois_category_section.dart';
import 'package:karim_flutter_task/features/offers_feature/presentation/view/components/error_state_widget.dart';
import 'package:karim_flutter_task/features/offers_feature/presentation/view/components/loading_state_widget.dart';

class CategoryFilterSection extends StatelessWidget {
  final Function(int) onCategorySelected;

  const CategoryFilterSection({
    super.key,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, categoryState) {
        if (categoryState is CategoryLoaded) {
          return SizedBox(
            height: 41,
            child: ListView.builder(
              itemCount: categoryState.categories.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: GestureDetector(
                  onTap: () => onCategorySelected(index),
                  child: ChoisCategorySection(
                    title: categoryState.categories[index].title,
                    isSelected: categoryState.selectedCategoryIndex == index,
                  ),
                ),
              ),
            ),
          );
        } else if (categoryState is CategoryLoading) {
          return const LoadingStateWidget(height: 41);
        } else if (categoryState is CategoryError) {
          return ErrorStateWidget(
            message: categoryState.message,
            height: 41,
            onRetry: () {
              context.read<CategoryCubit>().refreshCategories();
            },
          );
        }
        // Default fallback for CategoryInitial
        return const SizedBox.shrink();
      },
    );
  }
}
