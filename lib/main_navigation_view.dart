import 'package:flutter/material.dart';
import 'package:karim_flutter_task/features/offers_feature/presentation/view/offers_age_view.dart';
import 'package:karim_flutter_task/features/plans_selected_feature/presentation/view/plans_view.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int _selectedIndex = 2;

  // List of pages
  final List<Widget> _pages = [
    const OffersPageView(),
    const OffersPageView(),
    const OffersPageView(),
    const OffersPageView(),
    const PlansView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xff0062E2),
        unselectedItemColor: const Color(0xff090F1F).withAlpha(100),
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bungalow_outlined),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'محادثه',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'اضافه اعلان',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dataset_outlined),
            label: 'اعلاناتي',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'حسابي',
          ),
        ],
      ),
    );
  }
}
