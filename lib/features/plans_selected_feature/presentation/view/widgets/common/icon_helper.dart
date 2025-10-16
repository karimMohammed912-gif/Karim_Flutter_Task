import 'package:flutter/material.dart';

class IconHelper {
  static IconData? getIconFromString(String? iconString) {
    if (iconString == null) return null;

    switch (iconString) {
      case 'Icons.rocket_outlined':
        return Icons.rocket_outlined;
      case 'Icons.public':
        return Icons.public;
      case 'Icons.workspace_premium_outlined':
        return Icons.workspace_premium_outlined;
      default:
        return Icons.check; // Default fallback
    }
  }
}
