import 'package:flutter/material.dart';

class LoginA extends StatelessWidget {
  const LoginA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: const [
            Text('WELCOME',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text('login',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
