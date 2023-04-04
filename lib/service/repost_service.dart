import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:github_clone/config/api.dart';
import 'package:github_clone/model/exploreModel.dart';
import 'package:github_clone/model/profil_model.dart';
import 'package:github_clone/model/repost_model.dart';
import '../config/dio_error_exception.dart';
import 'log_service.dart';

class RepoService{

  static Future<Either<String,List<RepostModel?>>> getMyRepost() async{
    try{
      Response response = await Dio().get(
          Urls.getMyRepost,
          options: Options(headers: {
            'Accept': Urls.apiKey,
            'X-GitHub-Api-Version': Urls.apiKey2,
            'Authorization': 'Bearer ${Urls.token}'
          })
      );
      Log.w(response.statusCode.toString());
      if(response.statusCode == 200 || response.statusCode == 201){
        List<RepostModel?> photos = [];
        for (var e in (response.data as List)) {
          Log.i(e['name']);
          if(RepostModel.fromJson(e).runtimeType == RepostModel){
            photos.add(RepostModel.fromJson(e));

          }
        }
        return right(photos);
      }else{
        Log.e( DioExceptions.fromDioError(response.data).toString());
        return left(DioExceptions.fromDioError(response.data).toString());
      }
    } on DioError catch (e) {
      Log.e( e.toString());
      return left(DioExceptions.fromDioError(e).toString());
    } catch (m) {
      Log.e( m.toString());
      return left(m.toString());
    }
  }

  static Future<Either<String,ProfilModel>> getMyProfil(/*ProfilModel newPost*/) async{
    try{
      Response response = await Dio().get(
          Urls.getMyProfil,
          // data:  {
          //   "login" : newPost.login,
          //   "avatarUrl" : newPost.avatarUrl,
          //   "bio" : newPost.bio,
          //   "following" : newPost.following,
          //   "followers" : newPost.followers,
          //   "name" : newPost.name,
          // },
          options: Options(headers: {
            'Accept': Urls.apiKey,
            'X-GitHub-Api-Version': Urls.apiKey2,
            'Authorization': 'Bearer ${Urls.token}'
          })
      );
      Log.w(response.statusCode.toString());
      if(response.statusCode == 200 || response.statusCode == 201){
        ProfilModel user;
        user = ProfilModel.fromJson( response.data);
        // for (var e in (response.data as List)) {
        //   photos.add(ProfilModel.fromJson(e));
        //
        return right(user);
      }else{
        Log.e( DioExceptions.fromDioError(response.data).toString());
        return left(DioExceptions.fromDioError(response.data).toString());
      }
    } on DioError catch (e) {
      Log.e( e.toString());
      if(DioExceptions.fromDioError(e).toString() == 'Unauthorized'){
        return left('Token xatoo');
      }
      return left(DioExceptions.fromDioError(e).toString());
    } catch (m) {
      Log.e( m.toString());
      return left(m.toString());
    }
  }

  // static Future<Either<String,ProfilModel>> getProfil(String newUrl) async{
  //   try{
  //     Response response = await Dio().get(
  //         newUrl,
  //         options: Options(headers: {
  //           'Accept': Urls.apiKey,
  //           'X-GitHub-Api-Version': Urls.apiKey2,
  //           'Authorization': 'Bearer ${Urls.token}'
  //         })
  //     );
  //     Log.w(response.statusCode.toString());
  //     if(response.statusCode == 200 || response.statusCode == 201){
  //       ProfilModel user;
  //       user = ProfilModel.fromJson( response.data);
  //       return right(user);
  //     }else{
  //       Log.e( DioExceptions.fromDioError(response.data).toString());
  //       return left(DioExceptions.fromDioError(response.data).toString());
  //     }
  //   } on DioError catch (e) {
  //     Log.e( e.toString());
  //     if(DioExceptions.fromDioError(e).toString() == 'Unauthorized'){
  //       return left('Token xatoo');
  //     }
  //     return left(DioExceptions.fromDioError(e).toString());
  //   } catch (m) {
  //     Log.e( m.toString());
  //     return left(m.toString());
  //   }
  // }

  static Future<Either<String,List<RepostModel>>> RepoFayills(RepostModel name,RepostModel project,) async{
    try{
      Response response = await Dio().get(
          '${Urls.repoFaylls}$name/$project/contents',
          options: Options(headers: {
            'Accept': Urls.apiKey,
            'Authorization': 'Bearer ${Urls.token}',
            'X-GitHub-Api-Version': Urls.apiKey2,
          })
      );
      Log.w(response.statusCode.toString());
      if(response.statusCode == 200 || response.statusCode == 201){
        List<RepostModel> photos = [];
        for (var e in (response.data as List)) {
          photos.add(RepostModel.fromJson(e));
        }
        return right(photos);
      }else{
        Log.e( DioExceptions.fromDioError(response.data).toString());
        return left(DioExceptions.fromDioError(response.data).toString());
      }
    } on DioError catch (e) {
      Log.e( e.toString());
      if(DioExceptions.fromDioError(e).toString() == 'Unauthorized'){
        return left('Token xatoo');
      }
      return left(DioExceptions.fromDioError(e).toString());
    } catch (m) {
      Log.e( m.toString());
      return left(m.toString());
    }
  }

  static Future<Either<String,ProfilModel>> getProfil(String name,) async{
    try{
      Response response = await Dio().get(
          '${Urls.repoFaylls}$name',
          options: Options(headers: {
            'Accept': Urls.apiKey,
            'Authorization': 'Bearer ${Urls.token}',
            'X-GitHub-Api-Version': Urls.apiKey2,
          })
      );
      Log.w(response.statusCode.toString());
      if(response.statusCode == 200 || response.statusCode == 201){
        ProfilModel user;
        user = ProfilModel.fromJson( response.data);
        return right(user);
      }else{
        Log.e( DioExceptions.fromDioError(response.data).toString());
        return left(DioExceptions.fromDioError(response.data).toString());
      }
    } on DioError catch (e) {
      Log.e( e.toString());
      if(DioExceptions.fromDioError(e).toString() == 'Unauthorized'){
        return left('Token xatoo');
      }
      return left(DioExceptions.fromDioError(e).toString());
    } catch (m) {
      Log.e( m.toString());
      return left(m.toString());
    }
  }

  static Future<Either<String,List<RepostModel>>> getNotifications() async{
    try{
      Response response = await Dio().get(
          Urls.getNotifications,
          options: Options(headers: {
            'Accept': Urls.apiKey,
            'Authorization': 'Bearer ${Urls.token}',
            'X-GitHub-Api-Version': Urls.apiKey2,
          })
      );
      Log.w(response.statusCode.toString());
      if(response.statusCode == 200 || response.statusCode == 201){
        List<RepostModel> photos = [];
        for (var e in (response.data as List)) {
          photos.add(RepostModel.fromJson(e));
        }
        return right(photos);
      }else{
        Log.e( DioExceptions.fromDioError(response.data).toString());
        return left(DioExceptions.fromDioError(response.data).toString());
      }
    } on DioError catch (e) {
      Log.e( e.toString());
      if(DioExceptions.fromDioError(e).toString() == 'Unauthorized'){
        return left('Token xatoo');
      }
      return left(DioExceptions.fromDioError(e).toString());
    } catch (m) {
      Log.e( m.toString());
      return left(m.toString());
    }
  }

  static Future<Either<String,List<RepostModel>>> getNotificationsAll() async{
    try{
      Response response = await Dio().get(
          Urls.getNotificationsAll,
          options: Options(headers: {
            'Accept': Urls.apiKey,
            'Authorization': 'Bearer ${Urls.token}',
            'X-GitHub-Api-Version': Urls.apiKey2,
          })
      );
      Log.w(response.statusCode.toString());
      if(response.statusCode == 200 || response.statusCode == 201){
        List<RepostModel> photos = [];
        for (var e in (response.data as List)) {
          photos.add(RepostModel.fromJson(e));
        }
        return right(photos);
      }else{
        Log.e( DioExceptions.fromDioError(response.data).toString());
        return left(DioExceptions.fromDioError(response.data).toString());
      }
    } on DioError catch (e) {
      Log.e( e.toString());
      if(DioExceptions.fromDioError(e).toString() == 'Unauthorized'){
        return left('Token xatoo');
      }
      return left(DioExceptions.fromDioError(e).toString());
    } catch (m) {
      Log.e( m.toString());
      return left(m.toString());
    }
  }

  static Future<Either<String,List<RepostModel>>> getMyFollowers() async{
    try{
      Response response = await Dio().get(
          Urls.MyFollowers,
          options: Options(headers: {
            'Accept': Urls.apiKey,
            'Authorization': 'Bearer ${Urls.token}',
            'X-GitHub-Api-Version': Urls.apiKey2,
          })
      );
      Log.w(response.statusCode.toString());
      if(response.statusCode == 200 || response.statusCode == 201){
        List<RepostModel> photos = [];
        for (var e in (response.data as List)) {
          photos.add(RepostModel.fromJson(e));
        }
        return right(photos);
      }else{
        Log.e( DioExceptions.fromDioError(response.data).toString());
        return left(DioExceptions.fromDioError(response.data).toString());
      }
    } on DioError catch (e) {
      Log.e( e.toString());
      if(DioExceptions.fromDioError(e).toString() == 'Unauthorized'){
        return left('Token xatoo');
      }
      return left(DioExceptions.fromDioError(e).toString());
    } catch (m) {
      Log.e( m.toString());
      return left(m.toString());
    }
  }

  static Future<Either<String,List<RepostModel>>> getMyFollowing() async{
    try{
      Response response = await Dio().get(
          Urls.MyFollowing,
          options: Options(headers: {
            'Accept': Urls.apiKey,
            'Authorization': 'Bearer ${Urls.token}',
            'X-GitHub-Api-Version': Urls.apiKey2,
          })
      );
      Log.w(response.statusCode.toString());
      if(response.statusCode == 200 || response.statusCode == 201){
        List<RepostModel> photos = [];
        for (var e in (response.data as List)) {
          photos.add(RepostModel.fromJson(e));
        }
        return right(photos);
      }else{
        Log.e( DioExceptions.fromDioError(response.data).toString());
        return left(DioExceptions.fromDioError(response.data).toString());
      }
    } on DioError catch (e) {
      Log.e( e.toString());
      if(DioExceptions.fromDioError(e).toString() == 'Unauthorized'){
        return left('Token xatoo');
      }
      return left(DioExceptions.fromDioError(e).toString());
    } catch (m) {
      Log.e( m.toString());
      return left(m.toString());
    }
  }

  static Future<Either<String,List<ExploreModel>>> getExplore(String name) async{
    try{
      Response response = await Dio().get(
          '${Urls.getExplore}$name/received_events',
          options: Options(headers: {
            'Accept': Urls.apiKey,
            'Authorization': 'Bearer ${Urls.token}',
            'X-GitHub-Api-Version': Urls.apiKey2,
          })
      );
      Log.w(response.statusCode.toString());
      if(response.statusCode == 200 || response.statusCode == 201){
        List<ExploreModel> photos = [];
        for (var e in (response.data as List)) {
          photos.add(ExploreModel.fromJson(e));
        }
        return right(photos);
      }else{
        Log.e( DioExceptions.fromDioError(response.data).toString());
        return left(DioExceptions.fromDioError(response.data).toString());
      }
    } on DioError catch (e) {
      Log.e( e.toString());
      if(DioExceptions.fromDioError(e).toString() == 'Unauthorized'){
        return left('Token xatoo');
      }
      return left(DioExceptions.fromDioError(e).toString());
    } catch (m) {
      Log.e( m.toString());
      return left(m.toString());
    }
  }

  // static Future<Either<String,List<RepostModel>>> searchPhotos({String? search, int? page}) async{
  //   try{
  //     Response response = await Dio().get(
  //         '${Endpoints.searchPhotos}?query=$search&page=$page&per_page=50&order_by=ASC',
  //         options: Options(headers: {
  //           'x-api-key': Endpoints.apiKey,
  //           'Authorization': 'Bearer ${Endpoints.token}'
  //         })
  //     );
  //     Log.w(response.statusCode.toString());
  //     if(response.statusCode == 200 || response.statusCode == 201){
  //       List<PhotoModel> photos = [];
  //       for (var e in (response.data['results'] as List)) {
  //         photos.add(PhotoModel.fromJson(e));
  //       }
  //       return right(photos);
  //     }else{
  //       Log.e( DioExceptions.fromDioError(response.data).toString());
  //       return left(DioExceptions.fromDioError(response.data).toString());
  //     }
  //   } on DioError catch (e) {
  //     Log.e( e.toString());
  //     if(DioExceptions.fromDioError(e).toString() == 'Unauthorized'){
  //       return left('Token xatoo');
  //     }
  //     return left(DioExceptions.fromDioError(e).toString());
  //   } catch (m) {
  //     Log.e( m.toString());
  //     return left(m.toString());
  //   }
  // }


}


/*import 'package:dio/dio.dart';
import 'package:pinterest_clone/Model/photoModel.dart';
import '../core/dio/api.dart';
import '../core/dio/doi_config.dart';
import 'log_service.dart';

class PhotoService {
  static final PhotoService _inheritance = PhotoService._init();
  static PhotoService get inheritance => _inheritance;
  PhotoService._init();

  static Future<List<PhotoModel>?> getUsers() async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().get(
          Endpoints.getPhoto,
          options: Options(headers: {
            "Content-Type": "application/json",
            "x-api-key": Endpoints.apiKey
          }));
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200) {
        List<PhotoModel> PhotoList = [];
        for(var e in (res.data as List)) {
          PhotoList.add(PhotoModel.fromJson(e));
        }

        return PhotoList;
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
      }
    } on DioError catch (e) {
      Log.e(e.toString());
      if(e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());

    }
    return null;
  }

*//*
static Future<bool> deleteUser(String id) async {
  try {
    Response res = await DioConfig.inheritentce.createRequest().delete(
      Urls.deleteUsers + id.toString(),
    );
    Log.i(res.data.toString());
    Log.i(res.statusCode.toString());

    if(res.statusCode == 200 || res.statusCode == 201) {
      return true;
    } else {
      Log.e('${res.statusMessage} ${res.statusCode}');
      return false;
    }
  } on DioError catch (e) {
    if(e.response != null) {
      Log.e(e.response!.toString());
      return false;
    } else {
      rethrow;
    }
  } catch (e) {
    Log.e(e.toString());
    return false;
  }
  // return null;
}

static Future<bool> createUser(UserModel newPost) async {
  try {
    Response res = await DioConfig.inheritentce.createRequest().post(
        Urls.getUsers,
        data:  {
          "name" : newPost.name,
          "phone" : newPost.phone,
          "age" : newPost.age,
          "gender" : newPost.gender,
          "passport" : newPost.passport,
          "familyMembers" : newPost.familyMembers,
        }
    );
    Log.i(res.data.toString());
    Log.i(res.statusCode.toString());

    if(res.statusCode == 200 || res.statusCode == 201) {
      return true;
    } else {
      Log.e('${res.statusMessage} ${res.statusCode}');
      return false;
    }
  } on DioError catch (e) {
    if(e.response != null) {
      Log.e(e.response!.toString());
      return false;
    } else {
      rethrow;
    }
  } catch (e) {
    Log.e(e.toString());
    return false;
  }
  // return null;
}

static Future<bool> editUser(UserModel newPost) async {
  try {
    Response res = await DioConfig.inheritentce.createRequest().put(
        Urls.updateUsers + newPost.id.toString(),
        data:  {
          "name" : newPost.name,
          "phone" : newPost.phone,
          "age" : newPost.age,
          "gender" : newPost.gender,
          "passport" : newPost.passport,
          "familyMembers" : newPost.familyMembers,
        }
    );
    Log.i(res.data.toString());
    Log.i(res.statusCode.toString());

    if(res.statusCode == 200 || res.statusCode == 201) {
      return true;
    } else {
      Log.e('${res.statusMessage} ${res.statusCode}');
      return false;
    }
  } on DioError catch (e) {
    if(e.response != null) {
      Log.e(e.response!.toString());
      return false;
    } else {
      rethrow;
    }
  } catch (e) {
    Log.e(e.toString());
    return false;
  }
  // return null;
}
*//*

  // static Future<UserModel?> getUserById(int id) async {
  //   try {
  //     Response res = await DioConfig.inheritentce.createRequest().get(Urls.getSingleUsers + id.toString());
  //     Log.i(res.data.toString());
  //     Log.i(res.statusCode.toString());
  //
  //     if(res.statusCode == 200) {
  //       UserModel user  = UserModel.fromJson(res.data);
  //
  //       return user;
  //     } else {
  //       Log.e('${res.statusMessage} ${res.statusCode}');
  //     }
  //   } on DioError catch (e) {
  //     Log.e(e.toString());
  //     if(e.response != null) {
  //       Log.e(e.response!.toString());
  //     } else {
  //       rethrow;
  //     }
  //   } catch (e) {
  //     Log.e(e.toString());
  //
  //   }
  //   return null;
  // }


  //

  //

}*/

