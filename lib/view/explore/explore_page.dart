import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:github_clone/view/explore/widgets/explore_item.dart';
import '../../controller/explore_controller.dart';
import '../../controller/repositories_controller.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  final _controller = Get.put(ExploreController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.getExplore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text('Explore',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22,color: Colors.white),),
      ),
      body: GetBuilder(
        init: ExploreController(),
        builder: (controller){
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 170,
                  width: MediaQuery.of(context).size.height,
                  color: Colors.grey.shade900,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Discover',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.white),),
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: (){},
                          child: Row(
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/image/img_15.png'), fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Text('Trending Repositories',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
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
                                      image: AssetImage('assets/image/img_16.png'), fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Text('Awesome Lists',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text('Discover',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.white),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.filter_list_rounded,))
                    ],
                  ),
                ),
                Container(
                  height: _controller.explore.length*234,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _controller.explore.length,
                      itemBuilder: (context, index){
                        return ExploreItem(
                          context,
                          _controller.explore[index],
                        );
                      }
                  ),
                )
                //Center(child: Text('Something went wrong',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),)),
              ],
            ),
          );
        },
      ),

    );
  }
}
