import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Desktop extends StatelessWidget {
  const Desktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child:Container(
            height: double.infinity,
            color:Colors.amber ,
            child: Text('hi'),
          )),
          Expanded(child: Container(
            color:Colors.blue ,
          )),
        ],
      ),

    );
  }
}
