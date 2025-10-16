import 'package:karim_flutter_task/core/utils/database_helper.dart';
import 'package:karim_flutter_task/features/offers_feature/data/model/sub_category_model.dart';

class SubCategoryRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  // Get all subcategories from database
  Future<List<SubCategoryModel>> getAllSubCategories() async {
    try {
      return await _databaseHelper.getAllSubCategories();
    } catch (e) {
      throw Exception('Failed to fetch subcategories: $e');
    }
  }

  // Insert a new subcategory
  Future<int> insertSubCategory(SubCategoryModel subCategory) async {
    try {
      return await _databaseHelper.insertSubCategory(subCategory);
    } catch (e) {
      throw Exception('Failed to insert subcategory: $e');
    }
  }

  // Initialize sample subcategories if database is empty
  Future<void> initializeSampleSubCategories() async {
    try {
      final existingSubCategories = await getAllSubCategories();
      if (existingSubCategories.isEmpty) {
        final sampleSubCategories = _getSampleSubCategories();
        for (final subCategory in sampleSubCategories) {
          await insertSubCategory(subCategory);
        }
      }
    } catch (e) {
      throw Exception('Failed to initialize sample subcategories: $e');
    }
  }

  // Get sample subcategories data using assets
  List<SubCategoryModel> _getSampleSubCategories() {
    return [
      SubCategoryModel(
        title: 'موضة رجالى',
        imageUrl: 'assets/assets_category/category_photo_1.png',
      ),
      SubCategoryModel(
        title: 'ساعات',
        imageUrl: 'assets/assets_category/category_photo_2.png',
      ),
      SubCategoryModel(
        title: 'موبايلات',
        imageUrl: 'assets/assets_category/category_photo_3.png',
      ),
      SubCategoryModel(
        title: 'منتجات تجميل',
        imageUrl: 'assets/assets_category/category_photo_4.png',
      ),
      SubCategoryModel(
        title: 'عقارات',
        imageUrl: 'assets/assets_category/category_photo_5.jpg',
      ),
    ];
  }
}
