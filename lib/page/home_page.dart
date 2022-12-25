import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    print(data);
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
            Text("name: ${data['name']}"),
            SizedBox(height: 5,),
            Text("gender: ${data['gender']}"),
            SizedBox(height: 5,),
            Text("count: ${data['count']}"),
          ],
        ),
      )
    );
  }
}
