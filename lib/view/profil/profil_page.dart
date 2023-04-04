import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:github_clone/view/profil/widgets/popular_item.dart';
import '../../controller/Profil_controller.dart';
import '../home/search/search_page.dart';

class ProfilPage extends StatefulWidget {
   ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {

  final _controller = Get.put(ProfilController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Get.find<HomeController>().apiPostList();
    // _controller.apiMyRepos();
    _controller.apiMyProfile();
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
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
            icon: Icon(Icons.search, color: Colors.blue,),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.add_circle_outline, color: Colors.blue,),
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
                  height: 160,
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
                                    image: NetworkImage('${_controller.profil?.avatarUrl}')
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_controller.profil?.name ?? '',style: TextStyle(fontSize: 23,color: Colors.white, fontWeight: FontWeight.bold),),
                                Text(_controller.profil?.login ?? '',style: TextStyle(fontSize: 15,color: Colors.grey),),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Text(_controller.profil?.bio ??'',style: TextStyle(fontSize: 15,color: Colors.white),),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            const Icon(Icons.person_outline, color: Colors.grey,size: 17,),
                            Text(' ${_controller.profil?.followers ?? ''} followers - ${_controller.profil?.following ?? ''} following',
                              style: const TextStyle(fontSize: 15,color: Colors.white),
                            ),
                          ],
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
                            Icon(Icons.star, color: Colors.grey,),
                            Text('Popular',style: TextStyle(fontSize: 17,color: Colors.white),),
                          ],
                        ),
                        SizedBox(height: 12,),
                        SizedBox(
                          height: 170,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 20,
                              itemBuilder: (context, index){
                                return PopularItem(
                                  context,
                                  repos: _controller.profil!
                                );
                              }),
                        ),
                        SizedBox(height: 12,),
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
