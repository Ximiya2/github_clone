import 'package:flutter/material.dart';
import 'package:github_clone/controller/mainView_controler.dart';
import 'package:github_clone/service/di_service.dart';
import 'package:github_clone/view/mainView.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'config/storage/storage.dart';
import 'model/repost_model.dart';

void main() async{
  await DIService.init();
  runApp(const MyApp());
}
// Future<void> main() async {
//   // AppInit.configLoading();
//   await Hive.initFlutter();
//
//   Hive.registerAdapter(RepostModelAdapter());
//   Hive.registerAdapter(OwnerAdapter());
//   // Hive.registerAdapter(PermissionsAdapter());
//   // Hive.registerAdapter(HealthAdapter());
//   // Hive.registerAdapter(UrlsAdapter());
//   // // Hive.registerAdapter(UrlsAdapter());
//   // Hive.registerAdapter(UserAdapter());
//   // Hive.registerAdapter(UserLinksAdapter());
//   // Hive.registerAdapter(ProfileImageAdapter());
//   // Hive.registerAdapter(SocialAdapter());
//
//   // boxProf = await Hive.openBox('box');
//   // boxProf = await Hive.openBox('boxProf');
//   // AppInit.configLoading();
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainViewCtr(),
    );
  }
}
