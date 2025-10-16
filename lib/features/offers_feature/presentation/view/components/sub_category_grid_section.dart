import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karim_flutter_task/features/offers_feature/presentation/cubit/sub_category_cubit.dart';
import 'package:karim_flutter_task/features/offers_feature/presentation/view/components/sub_category_section.dart';
import 'package:karim_flutter_task/features/offers_feature/presentation/view/components/error_state_widget.dart';
import 'package:karim_flutter_task/features/offers_feature/presentation/view/components/loading_state_widget.dart';

class SubCategoryGridSection extends StatelessWidget {
  const SubCategoryGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoryCubit, SubCategoryState>(
      builder: (context, subCategoryState) {
        if (subCategoryState is SubCategoryLoaded) {
          return SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: subCategoryState.subCategories.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SubCategorySection(
                  title: subCategoryState.subCategories[index].title,
                  imageUrl: subCategoryState.subCategories[index].imageUrl,
                ),
              ),
            ),
          );
        } else if (subCategoryState is SubCategoryLoading) {
          return const LoadingStateWidget(height: 100);
        } else if (subCategoryState is SubCategoryError) {
          return ErrorStateWidget(
            message: subCategoryState.message,
            height: 100,
            onRetry: () {
              context.read<SubCategoryCubit>().refreshSubCategories();
            },
          );
        }
        // Default fallback for SubCategoryInitialState
        return const SizedBox(height: 100);
      },
    );
  }
}
