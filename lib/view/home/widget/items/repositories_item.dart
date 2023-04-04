import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_clone/model/repost_model.dart';

Widget RepositoriesItem(BuildContext context, RepostModel repo){
  return Container(
    height: 68,
    width: MediaQuery.of(context).size.width,
    child: Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(repo.owner.avatarUrl != null ? repo.owner.avatarUrl : 'assets/image/img_14.png'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(70),
          ),
        ),
        SizedBox(width: 15,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(repo.owner.login != null ? repo.owner.login.toString() : 'no data',style: TextStyle(fontSize: 15,color: Colors.grey),),
            Text(repo.name != null ? repo.name : 'no name',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Colors.white),),
          ],
        )
      ],
    ),
  );
}