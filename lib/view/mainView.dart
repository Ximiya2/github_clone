
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:github_clone/view/profil/profil_page.dart';

import 'explore/explore_page.dart';
import 'home/home_page.dart';
import 'notifications/notifications_page.dart';

class MainView extends StatelessWidget {
  final List<Widget> pages = [
          HomePage(),
          NotificationsPage(),
          ExplorePage(),
          ProfilPage(),
        ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
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
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Page 1',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Page 2',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Page 3',
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

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:github_clone/view/explore/explore_page.dart';
// import 'package:github_clone/view/notifications/notifications_page.dart';
// import 'package:github_clone/view/profil/profil_page.dart';
// import 'home/home_page.dart';
//
// class MainView extends StatefulWidget {
//   const MainView({Key? key}) : super(key: key);
//
//   @override
//   State<MainView> createState() => _MainViewState();
// }
//
// class _MainViewState extends State<MainView> {
//
//   int _currentIndex = 0;
//   final PageController _pageController = PageController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         physics: NeverScrollableScrollPhysics(),
//         controller: _pageController,
//         children: const [
//           HomePage(),
//           NotificationsPage(),
//           ExplorePage(),
//           ProfilPage(),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home'
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.notifications_none),
//               label: 'Notifications'
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.explore),
//               label: 'Explore'
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profil'
//           ),
//         ],
//         type: BottomNavigationBarType.fixed,
//         showSelectedLabels: true,
//         currentIndex: _currentIndex,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         unselectedLabelStyle: TextStyle(color: Colors.black),
//         showUnselectedLabels: true,
//         backgroundColor: Colors.grey.shade900,
//         elevation: 2,
//         onTap: (int index) {
//           setState(() {
//             _currentIndex = index;
//           });
//           _pageController.jumpToPage(index);
//         },
//       ),
//     );
//   }
// }
