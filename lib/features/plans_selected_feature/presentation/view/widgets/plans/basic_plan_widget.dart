import 'package:flutter/material.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/data/models/plan_model.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/presentation/view/widgets/common/title_and_plan_widget.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/presentation/view/widgets/common/plan_features_widget.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/presentation/view/widgets/common/icon_helper.dart';

class BasicPlanWidget extends StatelessWidget {
  const BasicPlanWidget({
    super.key,
    required this.plan,
    required this.isSelected,
    required this.onTap,
  });

  final PlanModel plan;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade400, width: 1),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
            child: TitleAndPlanWidget(
              title: plan.title,
              price: plan.price,
              isSelected: isSelected,
              onTap: onTap,
            ),
          ),

          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
            child: Column(
              children: plan.features.map((feature) {
                final hasSvg = feature.svg != null;
                final hasIcon = feature.icon != null;
                final iconToPass = !hasSvg && hasIcon
                    ? IconHelper.getIconFromString(feature.icon)
                    : null;
                final svgToPass = feature.svg;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: PlanFeaturesWidget(
                    icon: iconToPass,
                    svgPath: svgToPass,
                    text: feature.feature,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
