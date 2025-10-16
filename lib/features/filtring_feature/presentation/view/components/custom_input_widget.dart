import 'package:flutter/material.dart';


class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({
    super.key,
    required this.title,

    required this.hintText1,
    required this.hintText2,
  });

  final String hintText1;
  final String hintText2;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: hintText2,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: hintText1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
