class FeatureModel {
  final String feature;
  final String? icon;
  final String? svg;

  FeatureModel({
    required this.feature,
    this.icon,
    this.svg,
  });

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      feature: json['feature'] as String,
      icon: json['icon'] as String?,
      svg: json['svg'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'feature': feature,
      if (icon != null) 'icon': icon,
      if (svg != null) 'svg': svg,
    };
  }

  @override
  String toString() {
    return 'FeatureModel(feature: $feature, icon: $icon, svg: $svg)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FeatureModel &&
        other.feature == feature &&
        other.icon == icon &&
        other.svg == svg;
  }

  @override
  int get hashCode {
    return feature.hashCode ^
        icon.hashCode ^
        svg.hashCode;
  }
}
