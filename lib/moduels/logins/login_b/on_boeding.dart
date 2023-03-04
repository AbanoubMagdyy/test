import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:testing/componoents/components.dart';
import 'package:testing/moduels/logins/login_b/sign_in.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool choose =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('##D9C6E2'),
      body: SafeArea(
          child: Column(
            children: [
              Container(
            padding: const EdgeInsetsDirectional.all(5),
            width: double.infinity,
            height: 250,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
            ),
            child: const Image(
              image: AssetImage('assets/image/img_1.png'),
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Discover your',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Dream Jop Here',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'expiceall thr akdjd klkml lklkll lmlml lmlmm',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          const Text(
            'expiceall dsffsa thr akdjd klkml lklkll lmlml lmlmm',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  setState((){
                    choose =!choose;
                  });
                },
                child: Container(
                    padding: const EdgeInsetsDirectional.all(5),
                    width: 130,
                    height: 50,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color:choose? HexColor('#E0D4E6') : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                    )),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: (){
                  setState((){
                    choose =!choose;
                  });
                  navigateTo(context,  SignInScreen());
                },
                child: Container(
                    padding: const EdgeInsetsDirectional.all(5),
                    width: 130,
                    height: 50,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color:choose ? Colors.white : HexColor('#E0D4E6'),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      )),
    );
  }
}
