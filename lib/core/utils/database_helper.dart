import 'package:karim_flutter_task/features/offers_feature/data/model/category_model.dart';
import 'package:karim_flutter_task/features/offers_feature/data/model/sub_category_model.dart';
import 'package:karim_flutter_task/features/offers_feature/data/model/product_model.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/data/models/plan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'local_data.db');

    return await openDatabase(
      path,
      version: 8,
      onCreate: (db, version) async {
        // tables
        await db.execute('''
          CREATE TABLE products(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            imageUrl TEXT,
            price TEXT,
            originalPrice TEXT,
            salesCount TEXT,
            isFavorite INTEGER
          )
        ''');

        await db.execute('''
          CREATE TABLE categories(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            imageUrl TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE subcategories(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            imageUrl TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE plans(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            price TEXT,
            features TEXT,
            isSelected INTEGER,
            is48Days INTEGER
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        // Clear old data and recreate tables with new structure
        await db.execute('DROP TABLE IF EXISTS products');
        await db.execute('DROP TABLE IF EXISTS categories');
        await db.execute('DROP TABLE IF EXISTS subcategories');
        await db.execute('DROP TABLE IF EXISTS plans');

        // Recreate tables
        await db.execute('''
          CREATE TABLE products(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            imageUrl TEXT,
            price TEXT,
            originalPrice TEXT,
            salesCount TEXT,
            isFavorite INTEGER
          )
        ''');

        await db.execute('''
          CREATE TABLE categories(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            imageUrl TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE subcategories(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            imageUrl TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE plans(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            price TEXT,
            features TEXT,
            isSelected INTEGER,
            is48Days INTEGER
          )
        ''');
      },
    );
  }

  // ---------- Product CRUD ----------
  Future<int> insertProduct(ProductModel product) async {
    final db = await database;
    return await db.insert('products', product.toMap());
  }

  Future<List<ProductModel>> getAllProducts() async {
    final db = await database;
    final result = await db.query('products');
    return result.map((e) => ProductModel.fromMap(e)).toList();
  }

  Future<int> deleteProduct(int id) async {
    final db = await database;
    return await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateProductFavorite(int id, bool isFavorite) async {
    final db = await database;
    return await db.update(
      'products',
      {'isFavorite': isFavorite ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ---------- Category Operations ----------
  Future<int> insertCategory(CategoryModel category) async {
    final db = await database;
    return await db.insert('categories', category.toMap());
  }

  Future<List<CategoryModel>> getAllCategories() async {
    final db = await database;
    final result = await db.query('categories');
    return result.map((e) => CategoryModel.fromMap(e)).toList();
  }

  // ---------- SubCategory Operations ----------
  Future<int> insertSubCategory(SubCategoryModel subCategory) async {
    final db = await database;
    return await db.insert('subcategories', subCategory.toMap());
  }

  Future<List<SubCategoryModel>> getAllSubCategories() async {
    final db = await database;
    final result = await db.query('subcategories');
    return result.map((e) => SubCategoryModel.fromMap(e)).toList();
  }

  // ---------- Plan Operations ----------
  Future<int> insertPlan(PlanModel plan) async {
    final db = await database;
    return await db.insert('plans', plan.toMap());
  }

  Future<List<PlanModel>> getAllPlans() async {
    final db = await database;
    final result = await db.query('plans');
    return result.map((e) => PlanModel.fromMap(e)).toList();
  }
}
