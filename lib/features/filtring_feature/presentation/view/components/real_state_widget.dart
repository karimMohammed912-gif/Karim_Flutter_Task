import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RealStateWidget extends StatelessWidget {
  const RealStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('الفئه'),
          SizedBox(height: 16),
          Row(children: [
            SvgPicture.asset("assets/Svgs/_real_estate_agent_rounded.svg"),
            SizedBox(width: 16),
            Column(
              children: [
                Text('عقارات'),
                Text('فلل للبيع'),
              ],
            ),
            Spacer(),
         Text('تغيير',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xff3B4CF2)),),
            SizedBox(width: 16),
          ],)
        ],
      ),
    );
  }
}