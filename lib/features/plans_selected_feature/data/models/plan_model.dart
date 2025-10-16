import 'package:karim_flutter_task/features/plans_selected_feature/data/models/feature_model.dart';
import 'dart:convert';

class PlanModel {
  final String title;
  final String price;
  final List<FeatureModel> features;
  final bool isSelected;
  final bool is48Days;

  PlanModel({
    required this.title,
    required this.price,
    required this.features,
    required this.isSelected,
    required this.is48Days,
  });
  factory PlanModel.fromMap(Map<String, dynamic> map) {
    List<FeatureModel> features = [];
    
    if (map['features'] != null && (map['features'] as String).isNotEmpty) {
      try {
        final featuresJson = jsonDecode(map['features'] as String) as List;
        features = featuresJson
            .map((featureJson) => FeatureModel.fromJson(featureJson as Map<String, dynamic>))
            .toList();
      } catch (e) {
        // Fallback to empty list if JSON parsing fails
        features = [];
      }
    }

    return PlanModel(
      title: map['title'] as String,
      price: map['price'] as String,
      features: features,
      isSelected: (map['isSelected'] as int) == 1,
      is48Days: (map['is48Days'] as int) == 1,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'price': price,
      'features': jsonEncode(features.map((feature) => feature.toJson()).toList()),
      'isSelected': isSelected ? 1 : 0,
      'is48Days': is48Days ? 1 : 0,
    };
  }
}
