import 'package:flutter/material.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/presentation/view/widgets/common/plan_title_widget.dart';

class TitleAndPlanWidget extends StatelessWidget {
  const TitleAndPlanWidget({
    super.key,
    required this.title,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const baseStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      height: 1.0,
      color:  Color(0xFFF95B1C),
    );

    final nonUnderlinedStyle = baseStyle.copyWith(
      decoration: TextDecoration.none,
    );

    final underlinedStyle = baseStyle.copyWith(
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.solid,
      decorationThickness: 3.0,
      decorationColor: const Color(0xFFF95B1C),
    );

    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PlanTitleWidget(title: title, isSelected: isSelected),
          Spacer(),

          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: price, style: underlinedStyle),
                TextSpan(text: 'ج', style: nonUnderlinedStyle),
                TextSpan(text: '.', style: underlinedStyle),
                TextSpan(text: 'م', style: nonUnderlinedStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

