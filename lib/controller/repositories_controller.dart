import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:github_clone/model/profil_model.dart';
import 'package:github_clone/service/repost_service.dart';

class RepositoriesController extends GetxController {
  var isLoading = false;
  var posts = [];

  // TextEditingController nameCtr = TextEditingController();
  // TextEditingController loginCtr = TextEditingController();
  // TextEditingController avatarUrlCtr = TextEditingController();
  // TextEditingController bioCtr = TextEditingController();
  // TextEditingController followingCtr = TextEditingController();
  // TextEditingController followersCtr = TextEditingController();

  void apiMyRepos() async {
    isLoading = true;
    update();
    var res = await RepoService.getMyRepost();
    res.fold((l) {
     EasyLoading.showError(l);
    }, (r) {
      posts = r;
      update();
      EasyLoading.showSuccess('Successfully download');
    });
    isLoading = false;
    update();
  }
  // void apiMyProfil() async {
  //   isLoading = true;
  //   update();
  //   var res = await RepoService.getMyProfil();
  //   res.fold((l) {
  //     EasyLoading.showError(l);
  //   }, (r) {
  //     profil = r;
  //     EasyLoading.showSuccess('Successfully download');
  //   });
  //   isLoading = false;
  //   update();
  // }

// // void deletePost(BuildContext context, RepostModel post) async {
// //   isLoading = true;
// //   update();
// //   bool result = await RepoService.deletePost(post.id);
// //   if (result) {
// //     Utils.snackBarSucces('Deleted successfully', context);
// //   } else {
// //     Utils.snackBarError('Something is wrong', context);
// //   }
// //   isLoading = false;
// //   update();
// // }
// //
// // void editPost(
// //     BuildContext context,
// //     PostModel post,
// //     int index
// //     ) {
// //   isLoading = true;
// //   update();
// //   userIdCtr.text = post.userId.toString();
// //   titleCtr.text = post.title;
// //   bodyCtr.text = post.body;
// //   _showBottomSheet(context, () async {
// //         if(userIdCtr.text.isNotEmpty && titleCtr.text.isNotEmpty && bodyCtr.text.isNotEmpty) {
// //           PostModel newPost = PostModel(
// //               userId: int.parse(userIdCtr.text),
// //               id: int.parse(post.id.toString()[index]),
// //               title: titleCtr.text,
// //               body: bodyCtr.text);
// //           bool result = await GetPostService.editPost(newPost);
// //
// //           if(result){
// //             Utils.snackBarSucces('Update successfully', context);
// //             Navigator.pop(context);
// //           } else {
// //             Utils.snackBarError('Someting is wrong', context);
// //           }
// //         } else {
// //           Utils.snackBarError('Please fill all fileds', context);
// //         }
// //       });
// //   isLoading = false;
// //   update();
// // }
// // void addPost(
// //     BuildContext context,
// //     ){
// //   isLoading = true;
// //   update();
// //   _showBottomSheet(context, () async {
// //     if(userIdCtr.text.isNotEmpty && titleCtr.text.isNotEmpty && bodyCtr.text.isNotEmpty) {
// //       PostModel newPost = PostModel(
// //           userId: int.parse(userIdCtr.text),
// //           id: 1,
// //           title: titleCtr.text,
// //           body: bodyCtr.text);
// //       bool result = await GetPostService.editPost(newPost);
// //
// //       if(result){
// //         Utils.snackBarSucces('Update successfully', context);
// //         Navigator.pop(context);
// //       } else {
// //         Utils.snackBarError('Someting is wrong', context);
// //       }
// //     } else {
// //       Utils.snackBarError('Please fill all fileds', context);
// //     }
// //   });
// //   isLoading = false;
// //   update();
// // }
//
// void _showBottomSheet(BuildContext context, void Function() func) {
//   showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (BuildContext context,) {
//         return SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 const Text(
//                   'Add new post',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//                 TextFormField(
//                   controller: userIdCtr,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(labelText: 'UserId'),
//                 ),
//                 TextFormField(
//                   controller: titleCtr,
//                   decoration: InputDecoration(labelText: 'Age'),
//                 ),
//                 TextFormField(
//                   controller: bodyCtr,
//                   decoration: InputDecoration(labelText: 'Salary'),
//                 ),
//                 ElevatedButton(
//                   onPressed: func,
//                   child: Text('Add'),
//                 ),
//                 SizedBox(height: 400,)
//               ],
//             ),
//           ),
//         );
//       });
// }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../service/utils_service.dart';
//
// class UsersController extends GetxController {
//   var isLoading = false.obs;
//   var users = [].obs;
//
//   TextEditingController nameCtr = TextEditingController();
//
//   void apiUserList() async {
//     isLoading.value = true;
//     var res = await GetUsersService.getUsers();
//     if(res != null){
//       users.value = res;
//     }
//     isLoading.value = false;
//   }
//
//   void deleteUser(BuildContext context, UsersModel user) async {
//     isLoading.value = true;
//     bool result = await GetUsersService.deleteUsers(user.id);
//     if (result) {
//       Utils.snackBarSucces('Deleted successfully', context);
//     } else {
//       Utils.snackBarError('Something is wrong', context);
//     }
//     isLoading.value = false;
//   }
//
//   void editUser(
//       BuildContext context,
//       TextEditingController nameCtr,
//       UsersModel user,
//       int index
//       ) {
//     nameCtr.text = user.name;
//     _showBottomSheet(context, () async {
//           if(nameCtr.text.isNotEmpty) {
//             UsersModel newUser = UsersModel(
//                 id: 1,
//                 name: nameCtr.text,
//                 username: 'username',
//                 email: 'email',
//                 phone: 'phone',
//                 website: 'website',
//                 company: null,
//                 address: null);
//             bool result = await GetUsersService.editUsers(newUser);
//
//             if(result){
//               Utils.snackBarSucces('Update successfully', context);
//               Navigator.pop(context);
//             } else {
//               Utils.snackBarError('Someting is wrong', context);
//             }
//           } else {
//             Utils.snackBarError('Please fill all fileds', context);
//           }
//         });
//   }
//
//   void _showBottomSheet(BuildContext context, void Function() func) {
//     showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         builder: (BuildContext context,) {
//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   const Text(
//                     'Add new name',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 20.0),
//                   ),
//                   TextFormField(
//                     controller: nameCtr,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(labelText: 'Name'),
//                   ),
//                   ElevatedButton(
//                     onPressed: func,
//                     child: Text('Add'),
//                   ),
//                   SizedBox(height: 400,)
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }