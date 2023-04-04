import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:github_clone/model/exploreModel.dart';
import 'package:github_clone/model/profil_model.dart';
import 'package:github_clone/service/repost_service.dart';
import '../service/utils_service.dart';

class ExploreController extends GetxController {
  var isLoading = false;
  List<ExploreModel> explore = [];

  void getExplore() async {
    isLoading = true;
    update();
    var res = await RepoService.getExplore('Ximiya2');
    res.fold((l) {
      EasyLoading.showError(l);
    }, (r) {
      explore = r;
      EasyLoading.showSuccess('Successfully download');
    });
    isLoading = false;
    update();
  }

  // void getExploreRepoUrl() async {
  //   isLoading = true;
  //   update();
  //   var res = await RepoService.getProfil(urlRepoCtr.text);
  //   res.fold((l) {
  //     EasyLoading.showError(l);
  //   }, (r) {
  //     profilRepo = r;
  //     EasyLoading.showSuccess('Successfully download');
  //   });
  //   isLoading = false;
  //   update();
  // }
  //
  // void getExploreActorUrl() async {
  //   isLoading = true;
  //   update();
  //   var res = await RepoService.getProfil(urlActorCtr.text);
  //   res.fold((l) {
  //     EasyLoading.showError(l);
  //   }, (r) {
  //     profilActor = r;
  //     EasyLoading.showSuccess('Successfully download');
  //   });
  //   isLoading = false;
  //   update();
  // }
}