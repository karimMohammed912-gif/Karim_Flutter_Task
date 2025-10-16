import 'package:flutter/material.dart';


/// ```
class CircularProgressWidget extends StatelessWidget {
  final String displayValue;
  final Color fillColor;
  final Color textColor;
  final Color borderColor;

  const CircularProgressWidget({
    super.key,
    required this.displayValue,
    this.fillColor = const Color(0x0D3A813F), 
    this.textColor = const Color(0xFF3A813F),
    this.borderColor = const Color(0xFF3A813F),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 71,
      height: 42,

      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        border: Border(
          top: BorderSide(
            color: borderColor,
            width: 1,
          ),
          left: BorderSide(
            color: borderColor,
            width: 1,
          ),
          right: BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: Text(
          displayValue,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

