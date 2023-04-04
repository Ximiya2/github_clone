import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:github_clone/view/notifications/widgets/notifications_item.dart';
import '../../controller/notifications_controller.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {

  bool ctr = false;

  final _controller = Get.put(NotificationsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Get.find<HomeController>().apiPostList();
    _controller.apiMyNotific();
    _controller.apiMyNotificAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text('Notifications',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22,color: Colors.white),),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Theme(
            data: Theme.of(context).copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white)),
            child: Container(
              // height: 48.0,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 5,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade800, // Background color
                        shape: StadiumBorder()
                      ),
                      onPressed: (){
                        ctr = false;
                        setState(() {});
                      },
                      child: ctr == false ? Row(
                        children: const [
                          Text('All',style: TextStyle(fontSize: 15,color: Colors.white),),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ) : Text('All',style: TextStyle(fontSize: 15,color: Colors.white),),
                    ),
                    SizedBox(width: 10,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade800, // Background color
                          shape: StadiumBorder()
                      ),
                      onPressed: (){
                        ctr = true;
                        setState(() {});
                      },
                      child: ctr == true ? Row(
                        children: const [
                          Text('Unread',style: TextStyle(fontSize: 15,color: Colors.white),),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ) : Text('Unread',style: TextStyle(fontSize: 15,color: Colors.white),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 16, right: 16, left: 16),
          child: Column(
            children: [
              ctr != false ? SizedBox(
                height: _controller.notific1.length*100,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _controller.notific1.length,
                    itemBuilder: (context, index){
                      return NotificationsItem(context, _controller.notific1[index]); }
                ),
              )
                  : SizedBox(
                    height: _controller.notific2.length*100,
                    child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _controller.notific2.length,
                    itemBuilder: (context, index){
                      return NotificationsItem(context, _controller.notific2[index]); }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
