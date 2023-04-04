import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_clone/controller/repositories_controller.dart';
import 'package:github_clone/model/repost_model.dart';
import 'package:github_clone/service/repost_service.dart';
import 'package:github_clone/view/home/widget/items/repositories_item.dart';

class RepositoriesPage extends StatefulWidget {
  const RepositoriesPage({Key? key}) : super(key: key);

  @override
  State<RepositoriesPage> createState() => _RepositoriesPageState();
}

class _RepositoriesPageState extends State<RepositoriesPage> {

  final _controller = Get.put(RepositoriesController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Get.find<HomeController>().apiPostList();
    _controller.apiMyRepos();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text('Repositories',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22,color: Colors.white),),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Theme(
            data: Theme.of(context).copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white)),
            child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 5,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 74,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade800, // Background color
                            shape: StadiumBorder()
                        ),
                        onPressed: (){},
                        child: Row(
                          children: const [
                            Text('All',style: TextStyle(fontSize: 15,color: Colors.white),),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

          ),
        ),
      ),
      body: GetBuilder(
        init: RepositoriesController(),
        builder: (controller){
          return SingleChildScrollView(
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _controller.posts.isNotEmpty
                      ? SizedBox(
                    height: _controller.posts.length*68,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                        itemCount: _controller.posts.length,
                        itemBuilder: (context, index){
                          return RepositoriesItem(context, _controller.posts[index]);
                        }
                    ),
                  )
                      : const Center(child: Text('No data', style: TextStyle(fontSize: 25,color: Colors.white),),)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
