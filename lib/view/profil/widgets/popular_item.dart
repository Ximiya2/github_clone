import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_clone/model/repoModel.dart';

import '../../../model/profil_model.dart';
import '../../../model/repost_model.dart';

Widget PopularItem(BuildContext context, { required ProfilModel repos}){
  return Container(
    height: 200,
    width: 280,
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.grey.shade800,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(repos.avatarUrl.toString())
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                   Text(repos.login.toString(),style: TextStyle(fontSize: 17,color: Colors.grey),),
                ],
              ),
              const SizedBox(height: 5,),
              Text('imtihon_exam',style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.w500),),
            ],
          ),
        ),
        SizedBox(
          child: Row(
            children: [
              Icon(Icons.star, color: Colors.yellow,size: 17,),
              Text(' 1 ',style: TextStyle(fontSize: 15,color: Colors.grey),),
              Icon(Icons.circle, color: Colors.blueAccent,size: 17,),
              Text(' Dart'.toString(),style: TextStyle(fontSize: 12,color: Colors.grey),),
            ],
          ),
        ),
      ],
    ),
  );
}