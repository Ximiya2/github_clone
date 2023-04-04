import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:github_clone/view/profil/widgets/popular_item.dart';

import '../../../controller/Profil_controller.dart';

class UserProfilPage extends StatefulWidget {
  UserProfilPage({this.name,Key? key}) : super(key: key);

  String? name;

  @override
  State<UserProfilPage> createState() => _UserProfilPageState();
}

class _UserProfilPageState extends State<UserProfilPage> {

  final _controller = Get.put(ProfilController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.apiGetProfile(widget.name??'');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.share, color: Colors.blue,),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_horiz, color: Colors.blue,),
          ),
        ],
      ),
      body: GetBuilder(
        init: ProfilController(),
        builder: (controller){
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 330,
                  width: MediaQuery.of(context).size.height,
                  color: Colors.grey.shade900,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(_controller.profil?.avatarUrl.toString()??'')
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_controller.profil?.name.toString()??'',style: TextStyle(fontSize: 23,color: Colors.white, fontWeight: FontWeight.bold),),
                                Text(_controller.profil?.login.toString()??'',style: TextStyle(fontSize: 15,color: Colors.grey),),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        ElevatedButton(
                          onPressed: (){},
                          child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              color: Colors.grey.shade700,
                              child: Text('Modile Dev',style: TextStyle(fontSize: 15,color: Colors.white),)),
                        ),
                        SizedBox(height: 15,),
                        Text(_controller.profil?.bio.toString()??'',style: TextStyle(fontSize: 15,color: Colors.white),),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Icon(Icons.alternate_email, color: Colors.grey,),
                            Text(_controller.profil?.email??'',style: TextStyle(fontSize: 15,color: Colors.white),),
                            SizedBox(width: 10,),
                            Icon(Icons.location_on_outlined, color: Colors.grey,),
                            Text(_controller.profil?.location??'',style: TextStyle(fontSize: 15,color: Colors.white),),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Icon(Icons.radar, color: Colors.grey,),
                        Text(_controller.profil?.htmlUrl.toString()??'',style: TextStyle(fontSize: 15,color: Colors.white),),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Icon(Icons.person_outline, color: Colors.grey,size: 17,),
                            Text(' ${_controller.profil?.followers.toString()??0} followers - ${_controller.profil?.following.toString()??0} following',style: TextStyle(fontSize: 15,color: Colors.white),),
                          ],
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom( //<-- SEE HERE
                              side: BorderSide(
                                width: 3.0,
                              ),
                            ),
                            onPressed: (){},
                            child: Text('Following',style: TextStyle(fontSize: 15,color: Colors.white),)
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 401,
                  width: MediaQuery.of(context).size.height,
                  color: Colors.grey.shade900,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star_border_outlined, color: Colors.grey,size: 30,),
                            SizedBox(width: 10,),
                            Text('Pinned',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white),),
                          ],
                        ),
                        SizedBox(height: 12,),
                        SizedBox(
                          height: 10*200,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 10,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: PopularItem(context, repos: _controller.profil!),
                                ); }
                          ),
                        ),
                        Divider(thickness: 2,color: Colors.grey.shade800,),
                        InkWell(
                          onTap: (){},
                          child: Row(
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/image/img_3.png'), fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Text('Repositories',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        InkWell(
                          onTap: (){},
                          child: Row(
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/image/img_4.png'), fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Text('Organizations',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        InkWell(
                          onTap: (){},
                          child: Row(
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/image/img_5.png'), fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Text('Starred',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
