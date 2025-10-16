import 'package:flutter/material.dart';
import 'package:karim_flutter_task/core/utils/Custom_Button.dart';
import 'package:karim_flutter_task/features/filtring_feature/presentation/view/components/custom_input_widget.dart';
import 'package:karim_flutter_task/features/filtring_feature/presentation/view/components/real_state_widget.dart';
import 'components/filter_chip_group_widget.dart';

class FiltringView extends StatelessWidget {
  const FiltringView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12),
              const CustomAppBar(),
              const SizedBox(height: 20),
              const RealStateWidget(),
              const SizedBox(height: 20),
              const Divider(),
              const LocationWidget(),
              const Divider(),
              CustomInputWidget(
                title: 'الأقساط الشهرية',
                hintText1: '',
                hintText2: '',
              ),
              FilterChipGroupWidget(
                title: 'النوع',
                options: const ['الكل', 'تاون هاوس', 'فيلا منفصلة'],
                onSelected: (value) {},
              ),
              FilterChipGroupWidget(
                title: 'عدد الغرف',
                options: const ['4 غرف', '5 غرفة', 'الكل', 'غرفتين', '3 غرف'],
                onSelected: (value) {},
              ),

              SizedBox(height: 20),
              CustomInputWidget(
                title: 'الموقع',
                hintText1: 'اقل سعر',
                hintText2: 'اقصي سعر',
              ),
              SizedBox(height: 20),
              FilterChipGroupWidget(
                title: 'طريقة الدفع',
                options: const ['أي', 'تقسيط', 'كاش'],
                onSelected: (value) {},
              ),

              FilterChipGroupWidget(
                title: 'حالة العقار',
                options: const ['أي', 'جاهز', 'قيد الانشاء'],
                onSelected: (value) {},
              ),

              const SizedBox(height: 20),
              CustomButton(text: 'شاهد 10,000+ نتائج', hasarrow: false),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 32.0,
        top: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close),
          ),
          SizedBox(width: 12),
          Text(
            'فلتره',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500,color: Color(0xff090F1F)),
          ),
          Spacer(),
          Text(
            "رجوع للأفتراضى",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xff3B4CF2),
            ),
          ),
          SizedBox(width: 4),
        ],
      ),
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.location_on),
          Column(children: [Text('الموقع'), Text('الموقع')]),
          Spacer(),

          Icon(Icons.arrow_forward_ios),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
