import 'package:flutter/material.dart';

class ChoisCategorySection extends StatelessWidget {
  const ChoisCategorySection({
    super.key,
    required this.title,
    required this.isSelected,
  });
  final String title;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 94,
      height: 41,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.transparent : const Color(0xFFD9D9D9),
        ),
        color: isSelected
            ? Color(0xFFF95B1C).withAlpha(100)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Color(0xFFF95B1C) : const Color(0xFFD9D9D9),
          ),
        ),
      ),
    );
  }
}
