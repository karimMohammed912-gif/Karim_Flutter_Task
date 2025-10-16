import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karim_flutter_task/features/offers_feature/data/model/product_model.dart'
    as data_model;
import 'package:karim_flutter_task/features/offers_feature/presentation/cubit/product_cubit.dart';

class ProductActionHandler {
  static void onFavoritePressed(
    BuildContext context,
    data_model.ProductModel product,
  ) {
    context.read<ProductCubit>().toggleFavorite(product);
  }

  static void onCategorySelected(BuildContext context, int index) {
    // Only update UI selection, no product filtering
  }
}
