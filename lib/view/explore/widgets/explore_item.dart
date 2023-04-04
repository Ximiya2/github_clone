import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_clone/model/exploreModel.dart';
import 'package:github_clone/model/profil_model.dart';
import 'package:github_clone/view/profil/widgets/user_profil_page.dart';

import '../../../model/repost_model.dart';

Widget ExploreItem(BuildContext context,ExploreModel explore,){
  return Container(
    height: 234,
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: Image(
                              image: NetworkImage(explore.actor.avatarUrl),
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 1,
                          right: 1,
                          child: Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(70),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.black,
                                )
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(70),
                              child: const Image(
                                image: AssetImage('assets/image/img_17.png'),
                                width: 13,
                                height: 13,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 5,),
                    TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserProfilPage(name: explore.actor.login)),
                          );
                        },
                        child: Text(explore.actor.login,style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700,color: Colors.white), ),
                    ),
                    SizedBox(width: 5,),
                    Text('created a respository',style: TextStyle(fontSize: 10,color: Colors.grey), ),
                  ],
                ),
              ),
              Text(time(explore),style: TextStyle(fontSize: 13,color: Colors.grey), ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
          height: 176,
          padding: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.height,
          color: Colors.grey.shade900,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Image(
                        image: NetworkImage(explore.actor.avatarUrl),
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text(explore.repo.name,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700,color: Colors.white), ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Icon(Icons.star_border_outlined,size:19, color: Colors.grey,),
                  Text('0',style: TextStyle(fontSize: 18,color: Colors.grey), ),
                  SizedBox(width: 10,),
                  Icon(Icons.radio_button_off_sharp, size:17,  color: Colors.greenAccent,),
                  Text('Dart',style: TextStyle(fontSize: 15,color: Colors.grey), ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(height: 10,),
                  Icon(Icons.person_outline, size: 18, color: Colors.grey,),
                  Text('1 contributor',style: TextStyle(fontSize: 15,color: Colors.grey), ),
                ],
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade800,
                ),
                  onPressed: (){}, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star_border_outlined, color: Colors.white,),
                      Text('STAR',style: TextStyle(fontSize: 17,color: Colors.white), ),
                    ],
                  ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
String time(ExploreModel explore){
  var time = DateTime.now();

  if(time.year - explore.createdAt.year < 1){
    if(time.month - explore.createdAt.month < 1){
      if(time.day - explore.createdAt.day < 1){
        if(time.hour - explore.createdAt.hour < 1){
          if(time.minute - explore.createdAt.minute < 1){
            return '${time.second - explore.createdAt.second}sec';
          } else {return '${explore.createdAt.minute}min';}
        }  else {return '${explore.createdAt.hour}h';}
      } else {return '${explore.createdAt.day}d';}
    } else {return '${explore.createdAt.month}mon';}
  }  else {return '${explore.createdAt.year}y';}
}