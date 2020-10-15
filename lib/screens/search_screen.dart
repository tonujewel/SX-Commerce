import 'package:flutter/material.dart';
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Search Screen")),),
        body: Column(
          children: [
            SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30.0))),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      filled: true,
                      fillColor: Colors.grey[200]
                  )
              ),
            ),
          ],
        )
      ),
    );
  }
}
