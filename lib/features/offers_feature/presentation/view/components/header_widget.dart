import 'package:flutter/material.dart';
import 'package:karim_flutter_task/features/filtring_feature/presentation/view/filtring_view.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "استكشف العروض",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff090F1F)),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
          child: Row(
            children: [
              Text(
                'الكل',
                style: TextStyle(fontSize: 14, color: Color(0xff000000).withAlpha(100),),
              ),

              IconButton(
                iconSize: 20,
                color: Color(0xff000000).withAlpha(100),
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FiltringView(),
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
