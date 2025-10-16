import 'package:karim_flutter_task/core/utils/database_helper.dart';
import 'package:karim_flutter_task/features/offers_feature/data/model/category_model.dart';

class CategoryReopsitory {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  // Get all categories from database
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      return await _databaseHelper.getAllCategories();
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }

  // Insert a new category
  Future<int> insertCategory(CategoryModel category) async {
    try {
      return await _databaseHelper.insertCategory(category);
    } catch (e) {
      throw Exception('Failed to insert category: $e');
    }
  }

  // Initialize sample categories if database is empty
  Future<void> initializeSampleCategories() async {
    try {
      final existingCategories = await getAllCategories();
      if (existingCategories.isEmpty) {
        final sampleCategories = _getSampleCategories();
        for (final category in sampleCategories) {
          await insertCategory(category);
        }
      }
    } catch (e) {
      throw Exception('Failed to initialize sample categories: $e');
    }
  }

  // Get sample categories data using assets
  List<CategoryModel> _getSampleCategories() {
    return [
      CategoryModel(title: 'كل العروض'),
      CategoryModel(title: 'ملابس'),
      CategoryModel(title: 'أكسسوارات'),
      CategoryModel(title: 'الكترونيات'),
      CategoryModel(title: 'منتجات تجميل'),
      CategoryModel(title: 'عقارات'),
    ];
  }
}
