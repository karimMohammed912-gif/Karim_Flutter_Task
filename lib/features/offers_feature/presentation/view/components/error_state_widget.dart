import 'package:flutter/material.dart';

class ErrorStateWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final double? height;
  final double? fontSize;

  const ErrorStateWidget({
    super.key,
    required this.message,
    this.onRetry,
    this.height,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error: $message',
              style: TextStyle(
                color: Colors.red,
                fontSize: fontSize,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onRetry,
                child: const Icon(
                  Icons.refresh,
                  color: Colors.red,
                  size: 16,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
