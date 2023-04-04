import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:github_clone/controller/explore_controller.dart';
import '../controller/Profil_controller.dart';
import '../controller/mainView_controler.dart';
import '../controller/notifications_controller.dart';
import '../controller/repositories_controller.dart';
import '../controller/home_controller.dart';

class DIService {
  static Future<void> init() async {
    Get.lazyPut<NotificationsController>(() => NotificationsController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<ProfilController>(() => ProfilController(), fenix: true);
    Get.lazyPut<RepositoriesController>(() => RepositoriesController(), fenix: true);
    Get.lazyPut<BottomNavigationController>(() => BottomNavigationController(), fenix: true);
    Get.lazyPut<ExploreController>(() => ExploreController(), fenix: true);
  }
}