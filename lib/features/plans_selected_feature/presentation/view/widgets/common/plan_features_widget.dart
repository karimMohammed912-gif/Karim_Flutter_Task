import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlanFeaturesWidget extends StatelessWidget {
  const PlanFeaturesWidget({
    super.key,
    this.icon,
    required this.text,
    this.isTimeLimited = false,
    this.svgPath,
  });

  final IconData? icon;
  final String? svgPath;
  final String text;
  final bool isTimeLimited;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon != null
            ? Icon(icon)
            : svgPath != null
            ? SvgPicture.asset(svgPath!, height: 20, width: 20)
            : SizedBox.shrink(),
        SizedBox(width: 4),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                maxLines: 2,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                overflow: TextOverflow.visible,
                softWrap: true,
              ),
              if (isTimeLimited)
                Text(
                  "( خلال ال48 ساعة القادمة )",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffFF4144),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
