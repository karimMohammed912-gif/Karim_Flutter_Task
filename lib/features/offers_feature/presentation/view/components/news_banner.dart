import 'package:flutter/material.dart';

class NewsBanner extends StatelessWidget {
  const NewsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 32,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Color(0xFFF95B1C).withAlpha(100),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Icon(Icons.check, color: Color(0xff3A813F), size: 24),
              SizedBox(width: 4),
              Text(
                "شحن مجانى",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff3A813F),
                ),
              ),

              SizedBox(width: 10),
            ],
          ),
          Spacer(),
          Text(
            " لأى عرض تطلبه دلوقتى! ",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color(0xff090F1F),
            ),
          ),

          SizedBox(width: 10),
        ],
      ),
    );
  }
}
