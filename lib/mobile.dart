import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing/adaptive_indicator.dart';
import 'package:testing/componoents/constants.dart';

class Mobile extends StatelessWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child:Container(
            width: double.infinity,
            color:Colors.amber ,
            child: Text('hi'),
          )),
          Expanded(child: Container(
            color:Colors.blue ,
          )),
          AdaptiveIndicator(os: getOs())
        ],
      ),

    );
  }
}
