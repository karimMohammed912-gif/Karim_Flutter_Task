import 'package:flutter/material.dart';

class PriceFlagWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const PriceFlagWidget({
    super.key,
    this.text = 'أفضل قيمة مقابل سعر',
    this.backgroundColor = const Color(0xffFFDBDB),
    this.textColor = const Color(0xffFF4144),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: FlagPainter(backgroundColor: backgroundColor),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 16, top: 8, bottom: 8),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class FlagPainter extends CustomPainter {
  final Color backgroundColor;

  FlagPainter({required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final path = Path();

    // Start from top left
    path.moveTo(0, 0);

    // Top edge to top right
    path.lineTo(size.width, 0);

    // Right edge down
    path.lineTo(size.width, size.height);

    // Bottom edge to the notch point
    path.lineTo(0, size.height);

    // Create the triangular notch on the left side
    // Go up to middle
    path.lineTo(0, size.height);

    // Cut inward (the notch)
    path.lineTo(10, size.height * 0.5);

    // Go back out
    path.lineTo(0, size.height * 0.11);

    // Complete to top
    path.lineTo(0, 0);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(FlagPainter oldDelegate) =>
      backgroundColor != oldDelegate.backgroundColor;
}
