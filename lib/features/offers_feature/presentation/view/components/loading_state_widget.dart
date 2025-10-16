import 'package:flutter/material.dart';

class LoadingStateWidget extends StatelessWidget {
  final double? height;
  final double? indicatorSize;

  const LoadingStateWidget({
    super.key,
    this.height,
    this.indicatorSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: indicatorSize != null
            ? SizedBox(
                width: indicatorSize,
                height: indicatorSize,
                child: const CircularProgressIndicator(),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
