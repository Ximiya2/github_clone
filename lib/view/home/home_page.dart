import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_clone/view/home/search/search_page.dart';
import 'package:github_clone/view/home/widget/repositories_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 0,
        title: Text('Home',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22,color: Colors.white),),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('My Work', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color: Colors.white),),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.more_horiz, color: Colors.grey,),
                  ),
                ],
              ),
              InkWell(
                onTap: (){},
                child: Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/image/img_1.png'), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text('Issues',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
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
                            image: AssetImage('assets/image/img.png'), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text('Pull Requests',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
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
                            image: AssetImage('assets/image/img_2.png'), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text('Discussions',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RepositoriesPage()));
                },
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
              SizedBox(height: 15,),
              Divider(thickness: 1,color: Colors.grey.shade700,),
              SizedBox(height: 15,),
              Text('Favorites',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color: Colors.white),),
              SizedBox(height: 30,),
              Text(
                '   Add favorite repositories for quick acces at\n         any time, without having to search',
                style: TextStyle(fontSize: 17,color: Colors.white),),
              SizedBox(height: 15,),
              ElevatedButton(
                  onPressed: (){},
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey.shade800)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 12, left: 105, right: 105),
                    child: Text('ADD FAVORITES',style: TextStyle(fontSize: 15,color: Colors.blue),),
                  )
              ),
              SizedBox(height: 20,),
              Divider(thickness: 1,color: Colors.grey.shade700,),
              SizedBox(height: 15,),
              Text('Shortcuts',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color: Colors.white),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      SizedBox(width: 45,),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/img_6.png'), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/img_7.png'), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/img_8.png'), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/img_9.png'), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/img_10.png'), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/img_11.png'), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/img_12.png'), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/img_13.png'), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Text(
                    'The things you need, one tap away',
                    style: TextStyle(fontSize: 17,color: Colors.white),),
                  SizedBox(height: 15,),
                  Text(
                    'Fast access your lists oflssues, Pull Requests, \n                      or Discussions',
                    style: TextStyle(fontSize: 17,color: Colors.grey),),
                  SizedBox(height: 15,),
                  ElevatedButton(
                      onPressed: (){},
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey.shade800)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 12, left: 105, right: 105),
                        child: Text('GET STARTED',style: TextStyle(fontSize: 15,color: Colors.blue),),
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
