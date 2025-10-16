import 'package:flutter/material.dart';

class PlanTitleWidget extends StatelessWidget {
  const PlanTitleWidget({
    super.key,
    required this.title,
    required this.isSelected,
  });
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          checkColor: isSelected ? Colors.white : Colors.white,
          activeColor: isSelected ? Color(0xff3B4CF2) : Colors.black87,
          value: isSelected,
          onChanged: (value) {},
        ),
        Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isSelected ? Color(0xFF3B4CF2) : Colors.black87,
          ),
        ),
      ],
    );
  }
}
