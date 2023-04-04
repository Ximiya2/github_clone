import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:github_clone/view/home/home_page.dart';
import '../view/explore/explore_page.dart';
import '../view/notifications/notifications_page.dart';
import '../view/profil/profil_page.dart';

class MainViewCtr extends StatelessWidget {
  final List<Widget> pages = [
    const HomePage(),
    const NotificationsPage(),
    const ExplorePage(),
    ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationController>(
        builder: (controller) {
          return pages[controller.selectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<BottomNavigationController>(
        init: BottomNavigationController(),
        builder: (controller) {
          return BottomNavigationBar(
            currentIndex: controller.selectedIndex,
            onTap: controller.changePage,
            items: const [
              BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                  icon: Icon(Icons.home),
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                  backgroundColor: Colors.blue,

                  icon: Icon(Icons.notifications_none),
                  label: 'Notifications'
              ),
              BottomNavigationBarItem(
                  backgroundColor: Colors.blue,

                  icon: Icon(Icons.explore),
                  label: 'Explore'
              ),
              BottomNavigationBarItem(
                  backgroundColor: Colors.blue,

                  icon: Icon(Icons.person),
                  label: 'Profil'
              ),
            ],
            type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        // currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        showUnselectedLabels: true,
        backgroundColor: Colors.grey.shade900,
        elevation: 2,
          );
        },
      ),
    );
  }
}
class BottomNavigationController extends GetxController {
  int selectedIndex = 0;

  void changePage(int index) {
    selectedIndex = index;
    update();
  }
}