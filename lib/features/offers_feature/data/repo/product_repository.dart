import 'package:karim_flutter_task/core/utils/database_helper.dart';
import 'package:karim_flutter_task/features/offers_feature/data/model/product_model.dart';

class ProductRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  // Get all products from database
  Future<List<ProductModel>> getAllProducts() async {
    try {
      return await _databaseHelper.getAllProducts();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }

  // Insert a new product
  Future<int> insertProduct(ProductModel product) async {
    try {
      return await _databaseHelper.insertProduct(product);
    } catch (e) {
      throw Exception('Failed to insert product: $e');
    }
  }

  // Delete a product
  Future<int> deleteProduct(int id) async {
    try {
      return await _databaseHelper.deleteProduct(id);
    } catch (e) {
      throw Exception('Failed to delete product: $e');
    }
  }

  // Update product favorite status
  Future<int> updateProductFavorite(int id, bool isFavorite) async {
    try {
      final db = await _databaseHelper.database;
      return await db.update(
        'products',
        {'isFavorite': isFavorite ? 1 : 0},
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw Exception('Failed to update product favorite: $e');
    }
  }

  // Initialize sample products if database is empty
  Future<void> initializeSampleProducts() async {
    try {
      final existingProducts = await getAllProducts();
      if (existingProducts.isEmpty) {
        final sampleProducts = _getSampleProducts();
        for (final product in sampleProducts) {
          await insertProduct(product);
        }
      }
    } catch (e) {
      throw Exception('Failed to initialize sample products: $e');
    }
  }

  // Get sample products data
  List<ProductModel> _getSampleProducts() {
    return [
      ProductModel(
        title: 'جاكيت من الصوف',
        imageUrl: 'assets/products/Product_1.png',
        price: '32,000,000 جم',
        originalPrice: '60,000,000 جم',
        salesCount: 'تم بيع +3.3k',
        isFavorite: false,
      ),
      ProductModel(
        title: 'قميص كاجوال',
        imageUrl: 'assets/products/Product-2.png',
        price: '25,000,000 جم',
        originalPrice: '50,000,000 جم',
        salesCount: 'تم بيع +2.1k',
        isFavorite: true,
      ),
      ProductModel(
        title: 'بنطلون جينز',
        imageUrl: 'assets/products/Product_3.png',
        price: '40,000,000 جم',
        originalPrice: '',
        salesCount: 'تم بيع +1.8k',
        isFavorite: false,
      ),
      ProductModel(
        title: 'حذاء رياضي',
        imageUrl: 'assets/products/Product_1.png',
        price: '55,000,000 جم',
        originalPrice: '110,000,000 جم',
        salesCount: 'تم بيع +4.5k',
        isFavorite: false,
      ),
      ProductModel(
        title: 'ساعة يد',
        imageUrl: 'assets/products/Product-2.png',
        price: '80,000,000 جم',
        originalPrice: '',
        salesCount: 'تم بيع +900',
        isFavorite: false,
      ),
      ProductModel(
        title: 'حقيبة ظهر',
        imageUrl: 'assets/products/Product_3.png',
        price: '35,000,000 جم',
        originalPrice: '70,000,000 جم',
        salesCount: 'تم بيع +1.2k',
        isFavorite: true,
      ),
    ];
  }
}
