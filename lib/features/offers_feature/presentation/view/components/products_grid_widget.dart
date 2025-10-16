import 'package:flutter/material.dart';
import 'package:karim_flutter_task/features/offers_feature/data/model/product_model.dart';
import 'product_card_widget.dart';

class ProductsGridWidget extends StatelessWidget {
  final List<ProductModel> products;
  final int crossAxisCount;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final EdgeInsetsGeometry? padding;

  const ProductsGridWidget({
    super.key,
    required this.products,
    this.crossAxisCount = 3,
    this.childAspectRatio = 0.7,
    this.crossAxisSpacing = 14.0,
    this.mainAxisSpacing = 14.0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: padding ?? const EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCardWidget(
          imageUrl: product.imageUrl,
          title: product.title,
          currentPrice: product.price,
          originalPrice: product.originalPrice,
          salesCount: product.salesCount,
          isFavorite: product.isFavorite,
          isVerified: true,
        );
      },
    );
  }
}
