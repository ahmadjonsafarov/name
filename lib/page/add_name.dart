import 'package:flutter/material.dart';
import 'package:name/page/home_page.dart';

class Add_name extends StatefulWidget {
  const Add_name({Key? key}) : super(key: key);

  @override
  State<Add_name> createState() => _Add_nameState();
}

class _Add_nameState extends State<Add_name> {
  TextEditingController textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD NAME"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              labelText: "Name"
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
            return Home_Page(name: textEditingController.text,);
          }), (route) => false);
        },

      ),
    );
  }
}
