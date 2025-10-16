import 'package:flutter/material.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/presentation/view/widgets/common/circular_progress_widget.dart';

class NumbersOfViews extends StatelessWidget {
  const NumbersOfViews({
    super.key,
    required this.displayValue,
  });
  final String displayValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressWidget(displayValue: displayValue),
          Text(
            'ضعف عدد \nالمشاهدات',
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: Color(0xff090F1F), 
              decorationThickness: 1, 
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
