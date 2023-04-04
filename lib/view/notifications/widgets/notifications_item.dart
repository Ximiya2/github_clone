import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/repost_model.dart';

Widget NotificationsItem(BuildContext context,RepostModel notific){
  return Container(
    height: 100,
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.share, color: Colors.purple, size: 20,),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notific.notificationsUrl.toString(),style: TextStyle(fontSize: 15,color: Colors.grey),),
                    SizedBox(height: 10,),
                    Text('fixed homePage',style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.w700),),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          width: 15.0,
                          height: 15.0,
                          decoration: const  BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/image/img_14.png'),
                            ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text('Merged #38 into main.',style: TextStyle(fontSize: 15,color: Colors.grey),),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Text('2mo',style: TextStyle(fontSize: 15,color: Colors.grey),),
          ],
        ),
        SizedBox(height: 10,),
        Divider(thickness: 2,color: Colors.grey.shade800,)
      ],
    ),
  );
}