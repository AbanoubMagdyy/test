import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:testing/style/color.dart';

import '../../../componoents/components.dart';


class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('##D9C6E2'),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Hello Again!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Welcome back you\'ve',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const Text(
                  'been missed!',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                defTextField(
                  validate: 'user can\'t be not empty',
                  controller: userName,
                  labelText: 'Enter username',
                  keyboard: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                defTextField(
                    validate: 'password can\'t be not empty',
                    controller: password,
                    labelText: 'password',
                    keyboard: TextInputType.visiblePassword,
                    suffixIcon: Icons.visibility_off),
                const SizedBox(
                  height: 10,
                ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     MaterialButton(
                       onPressed: (){},
                       child: const Text(
                         'forgetting password? ',
                       ),
                     ),
                   ],
                 ),
                defButton(
                    text: 'Sign In', onPressed: () {  }
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('ـــــــــــــ Or Sign with ـــــــــــــــ'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              boxShadow: const [
                              BoxShadow(
                                color: Colors.white,
                                spreadRadius: 2
                              )
                            ]
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              color: defaultColor,
                              borderRadius: BorderRadius.circular(110)
                          ),
                          child: const Image(
                            image:  AssetImage('assets/image/google.png'),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              boxShadow: const [
                              BoxShadow(
                                color: Colors.white,
                                spreadRadius: 2
                              )
                            ]
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              color: defaultColor,
                         //     borderRadius: BorderRadius.circular(1)
                          ),
                          child: const Image(
                            image:  AssetImage('assets/image/apple.png'),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
