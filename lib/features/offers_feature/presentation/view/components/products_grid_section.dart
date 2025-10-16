import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karim_flutter_task/features/offers_feature/presentation/cubit/product_cubit.dart';
import 'components_exports.dart';

class ProductsGridSection extends StatelessWidget {
  const ProductsGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, productState) {
        if (productState is ProductLoading) {
          return const LoadingStateWidget();
        } else if (productState is ProductError) {
          return ErrorStateWidget(message: productState.message, fontSize: 14);
        } else if (productState is ProductLoaded) {
          // Show all products without filtering
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.43,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
            ),
            itemCount: productState.products.length,
            itemBuilder: (context, index) {
              final product = productState.products[index];
              return ProductCardWidget(
                imageUrl: product.imageUrl,
                title: product.title,
                currentPrice: product.price,
                originalPrice: product.originalPrice,
                salesCount: product.salesCount,
                isFavorite: product.isFavorite,
                isVerified:
                    true, // Default to true since our model doesn't have this field
                onFavoritePressed: () =>
                    ProductActionHandler.onFavoritePressed(context, product),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
