import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/constant/color_const.dart';
import 'package:medicine_app/controller/navigation_controller.dart';
import 'package:medicine_app/view/screen/chat/chat_list_screen.dart';
import 'package:medicine_app/view/screen/customer/customer_main_home_screen.dart';

import 'package:medicine_app/view/screen/profile/profile_screen.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

import '../customer/all_medicine_screen.dart';

class NavigationScreen extends StatelessWidget {
  final NavigationController _navigationController =
      Get.put(NavigationController());

  final List<Widget> _pages = [
    const CustomerMainHomeScreen(),
    const ChatListScreen(),
    const AllMedicineScreen(),
    const ProfileScreen(),
  ];

  NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _navigationController.pageController,
        onPageChanged: _navigationController.onPageChanged,
        children: _pages,
      ),
      bottomNavigationBar: Obx(() {
        return ResponsiveNavigationBar(
          backgroundColor: kPrimaryColor,
          selectedIndex: _navigationController.selectedIndex.value,
          onTabChange: _navigationController.onItemTapped,
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          navigationBarButtons: const <NavigationBarButton>[
            NavigationBarButton(
              text: 'Home',
              icon: Icons.home,
              backgroundGradient: LinearGradient(
                colors: [kPinkColor, kPinkColor],
              ),
            ),
            NavigationBarButton(
              text: 'Chat',
              icon: Icons.chat,
              backgroundGradient: LinearGradient(
                colors: [kPinkColor, kPinkColor],
              ),
            ),
            NavigationBarButton(
              text: 'Medicines',
              icon: Icons.medical_information,
              backgroundGradient: LinearGradient(
                colors: [kPinkColor, kPinkColor],
              ),
            ),
            NavigationBarButton(
              text: "Profile",
              icon: Icons.person,
              backgroundGradient: LinearGradient(
                colors: [kPinkColor, kPinkColor],
              ),
            ),
          ],
        );
      }),
    );
  }
}
