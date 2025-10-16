import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karim_flutter_task/features/offers_feature/data/model/product_model.dart';
import 'package:karim_flutter_task/features/offers_feature/data/repo/product_repository.dart';

// States
sealed class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;

  ProductLoaded({required this.products});
}

class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});
}

// Cubit
class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _productRepository;

  ProductCubit({required ProductRepository productRepository})
    : _productRepository = productRepository,
      super(ProductInitial());

  // Load all products
  Future<void> loadProducts() async {
    emit(ProductLoading());
    try {
      await Future.delayed(const Duration(seconds: 3));
      await _productRepository.initializeSampleProducts();
      final products = await _productRepository.getAllProducts();
      emit(ProductLoaded(products: products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

 // Toggle favorite status
  Future<void> toggleFavorite(ProductModel product) async {
    final currentState = state;
    if (currentState is ProductLoaded) {
      try {
        // Update in database
        await _productRepository.updateProductFavorite(
          product
              .hashCode, // Using hashCode as ID since ProductModel doesn't have ID
          !product.isFavorite,
        );

        // Update local state
        final updatedProducts = currentState.products.map((p) {
          if (p.title == product.title && p.imageUrl == product.imageUrl) {
            return ProductModel(
              title: p.title,
              imageUrl: p.imageUrl,
              price: p.price,
              originalPrice: p.originalPrice,
              salesCount: p.salesCount,
              isFavorite: !p.isFavorite,
            );
          }
          return p;
        }).toList();

        emit(ProductLoaded(products: updatedProducts));
      } catch (e) {
        emit(ProductError(message: e.toString()));
      }
    }
  }
}
