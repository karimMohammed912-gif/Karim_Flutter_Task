import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karim_flutter_task/features/offers_feature/data/repo/product_repository.dart';
import 'package:karim_flutter_task/features/offers_feature/data/repo/category_reopsitory.dart';
import 'package:karim_flutter_task/features/offers_feature/data/repo/sub_category_repository.dart';
import 'package:karim_flutter_task/features/offers_feature/presentation/cubit/product_cubit.dart';
import 'package:karim_flutter_task/features/offers_feature/presentation/cubit/category_cubit.dart';
import 'package:karim_flutter_task/features/offers_feature/presentation/cubit/sub_category_cubit.dart';
import 'package:karim_flutter_task/features/offers_feature/presentation/view/components/header_widget.dart';
import 'package:karim_flutter_task/features/offers_feature/presentation/view/components/news_banner.dart';
import 'components/components_exports.dart';

class OffersPageView extends StatelessWidget {
  const OffersPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
          create: (context) =>
              ProductCubit(productRepository: ProductRepository())
                ..loadProducts(),
        ),
        BlocProvider<CategoryCubit>(
          create: (context) =>
              CategoryCubit(categoryReopsitory: CategoryReopsitory())
                ..loadCategories(),
        ),
        BlocProvider<SubCategoryCubit>(
          create: (context) =>
              SubCategoryCubit(subCategoryRepository: SubCategoryRepository())
                ..loadSubCategories(),
        ),
      ],
      child: const _OffersPageContent(),
    );
  }
}

class _OffersPageContent extends StatelessWidget {
  const _OffersPageContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(padding: EdgeInsets.only(top: 45.0)),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    HeaderWidget(),
                    const SizedBox(height: 14),
                    CategoryFilterSection(
                      onCategorySelected: (index) =>
                          context.read<CategoryCubit>().selectCategory(index),
                    ),
                    const SizedBox(height: 33),
                    const SubCategoryGridSection(),
                    const SizedBox(height: 33),
                    if (context.read<ProductCubit>().state is ProductLoaded)
                      NewsBanner(),
                    const SizedBox(height: 20),
                    const ProductsGridSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
