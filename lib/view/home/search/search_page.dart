import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: TextFormField(
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: false,
              hintText: 'Search GitHub',
            hintStyle: TextStyle(color: Colors.grey )
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('Find your stuff.',style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.w700),)),
          SizedBox(height: 15,),
          Center(
            child: Text('Search all of GitHub for Poeple, Repositories,\n    Organizations, Issues, and Pull Requests',
              style: TextStyle(fontSize: 17,color: Colors.grey ),),
          ),
        ],
      ),
    );
  }
}
