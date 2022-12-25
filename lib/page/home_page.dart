import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:name/page/add_name.dart';

class Home_Page extends StatefulWidget {
  final String name;
  const Home_Page({Key? key, this.name='Ahmadjon',}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  dynamic data;
  bool isLoading=true;
  Future<void> getInformation() async {
    isLoading=true;
    setState(() {});
    final url=Uri.parse('https://api.genderize.io/?name=${widget.name}');
    final res= await http.get(url);
    data=jsonDecode(res.body);
    isLoading=false;
    setState(() {});
  }
  @override
  void initState() {
    getInformation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Name ${widget.name}"),
      ),
      body: Center(
        child: isLoading
            ?CircularProgressIndicator()
            :Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text("name: ${data['name']}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 20),),
            SizedBox(height: 5),
            Text("gender: ${data['gender']}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 20),),
            SizedBox(height: 5,),
            Text("count: ${data['count']}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 20),),
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(

        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return Add_name();
          }));
        },
        child: Icon(Icons.add),
    ),
    );
  }
}
