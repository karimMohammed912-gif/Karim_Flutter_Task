import 'package:karim_flutter_task/core/utils/database_helper.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/data/models/plan_model.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/data/models/feature_model.dart';

class PlanRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<PlanModel>> getAllPlans() async {
    try {
      return await _databaseHelper.getAllPlans();
    } catch (e) {
      throw Exception('Failed to fetch plans: $e');
    }
  }

  // Insert a new plan
  Future<int> insertPlan(PlanModel plan) async {
    try {
      return await _databaseHelper.insertPlan(plan);
    } catch (e) {
      throw Exception('Failed to insert plan: $e');
    }
  }

  // Update plan selection status
  Future<int> updatePlanSelection(int id, bool isSelected) async {
    try {
      final db = await _databaseHelper.database;
      return await db.update(
        'plans',
        {'isSelected': isSelected ? 1 : 0},
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw Exception('Failed to update plan selection: $e');
    }
  }

  // Initialize sample plans if database is empty
  Future<void> initializeSamplePlans() async {
    try {
      final existingPlans = await getAllPlans();
      if (existingPlans.isEmpty) {
        final samplePlans = _getSamplePlans();
        for (final plan in samplePlans) {
          await insertPlan(plan);
        }
      }
    } catch (e) {
      throw Exception('Failed to initialize sample plans: $e');
    }
  }

  // Get sample plans data
  List<PlanModel> _getSamplePlans() {
    return [
      PlanModel(
        title: 'اساسيه',
        price: '3,000',
        features: [
          FeatureModel(
            feature: "صلاحية الأعلان 30 يوم",
            icon: 'Icons.rocket_outlined',
          ),
        ],
        isSelected: false,
        is48Days: false,
      ),
      PlanModel(
        title: 'إكسترا',
        price: '5,000',
        features: [
          FeatureModel(
            feature: "صلاحية الأعلان 30 يوم",
            svg: 'assets/Svgs/acute.svg',
          ),
          FeatureModel(
            feature: "رفع لأعلى القائمة كل 3 أيام",
            icon: 'Icons.rocket_outlined',
          ),
          FeatureModel(
            feature: "تثبيت فى مقاول صحى",
            svg: 'assets/Svgs/keep.svg',
          ),
        ],
        isSelected: true,
        is48Days: true,
      ),
      PlanModel(
        title: 'بلس',
        price: '8,000',
        features: [
          FeatureModel(
            feature: "صلاحية الأعلان 30 يوم",
            svg: 'assets/Svgs/acute.svg',
          ),
          FeatureModel(
            feature: "رفع لأعلى القائمة كل 2 يوم",
            icon: 'Icons.rocket_outlined',
          ),
          FeatureModel(
            feature: "ظهور فى كل محافظات مصر",
            icon: 'Icons.workspace_premium_outlined',
          ),
          FeatureModel(
            feature: " تثبيت فى مقاول صحى فى الجهراء",
            svg: 'assets/Svgs/keep.svg',
          ),
          FeatureModel(
            feature: "تثبيت فى مقاول صحى",
            svg: 'assets/Svgs/keep.svg',
          ),
        ],
        isSelected: true,
        is48Days: true,
      ),
      PlanModel(
        title: 'سوبر',
        price: '12,000',
        features: [
          FeatureModel(
            feature: "صلاحية الأعلان 30 يوم",
            svg: 'assets/Svgs/acute.svg',
          ),
          FeatureModel(
            feature: "رفع لأعلى القائمة كل 2 يوم",
            icon: 'Icons.rocket_outlined',
          ),
          FeatureModel(
            feature: "ظهور فى كل محافظات مصر",
            icon: 'Icons.workspace_premium_outlined',
          ),
          FeatureModel(
            feature: " تثبيت فى مقاول صحى فى الجهراء",
            svg: 'assets/Svgs/keep.svg',
          ),
          FeatureModel(
            feature: "تثبيت فى مقاول صحى",
            svg: 'assets/Svgs/keep.svg',
          ),
        ],
        isSelected: false,
        is48Days: false,
      ),
    ];
  }
}
