import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/componoents/constants.dart';
import 'package:testing/desktop.dart';
import 'package:testing/moduels/shop_app/hello_screen.dart';
import 'package:testing/moduels/shop_app/home_screen.dart';
import 'package:testing/moduels/shop_app/on_bording.dart';
import 'package:testing/network/local/shared_preferences.dart';
import 'package:testing/network/remote/dio_helper.dart';
import 'package:testing/network/remote/dio_shop_app.dart';
import 'package:testing/shared/news_bloc/bolc_observer.dart';
import 'package:testing/shared/news_bloc/cubit.dart';
import 'package:testing/shared/news_bloc/states.dart';
import 'package:testing/shared/shop_bloc/cubit.dart';
import 'package:testing/shared/shop_bloc/states.dart';
import 'package:testing/style/color.dart';
import 'layout/news_screen.dart';
import 'layout/shop_screen.dart';
import 'mobile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedHelper.init();
  DioHelper.init();
  ShopDio.shopInit();
  HttpOverrides.global = MyHttpOverrides();
  bool? dark = SharedHelper.getData(key: 'isDark') ?? true;
bool onBoarding =SharedHelper.getAllData(key: 'onBoarding') ?? false;
token = SharedHelper.getAllData(key: 'token');
print(token);
Widget? widget;
if(onBoarding != null){
if(token != null){
  widget = const ShopScreen();
}else{
  widget = const HelloScreen();
}
}else {
  widget = const OnBoardingScreen();
}
  runApp(MyApp());
}

/*///shop app
class MyApp extends StatelessWidget{
   MyApp({Key? key,required this.startScreen}) : super(key: key);
 Widget startScreen;
  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (context)=> ShopCubit()..getData()..getCategories()..getProducts()..getFavorites(),
      child: BlocConsumer<ShopCubit,ShopStates>(
        listener: (context , state){},
        builder: (context , state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: startScreen ,
            theme: ThemeData(
                fontFamily:'bob',
                textTheme: TextTheme(
                    bodyLarge: TextStyle(
                        color: defShopColor
                    )
                )
            ),
          );
        },
      ),
    );
  }

}*/

///news app
// class MyApp extends StatelessWidget {
//   final bool dark;
//
//   const MyApp(this.dark, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => NewsCubit()
//         ..changeThemeMode(shared: dark)
//         ..getAllData()
//         ..getBusinessData()
//         ..getEntertainmentData()
//         ..getHealthData()
//         ..getScienceData()
//         ..getSportsData()
//         ..getTechData(),
//       child: BlocConsumer<NewsCubit, NewsState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             home: const NewsScreen(),
//             theme: ThemeData(
//               scaffoldBackgroundColor: Colors.white,
//               appBarTheme: const AppBarTheme(
//                   color: Colors.white,
//                   elevation: 0,
//                   titleTextStyle: TextStyle(
//                       color: Colors.black54,
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold),
//                   iconTheme: IconThemeData(
//                     color: Colors.black,
//                   ),
//                   systemOverlayStyle: SystemUiOverlayStyle(
//                       statusBarColor: Colors.white,
//                       statusBarIconBrightness: Brightness.dark)),
//               textTheme: const TextTheme(
//                 headline6: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   //fontSize: 20
//                 ),
//                 bodyText2: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             themeMode: NewsCubit.isDark ? ThemeMode.dark : ThemeMode.light,
//             darkTheme: ThemeData(
//               textTheme: const TextTheme(
//                 bodyText2: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   //fontSize: 20
//                 ),
//                 headline6: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   //fontSize: 20
//                 ),
//               ),
//               scaffoldBackgroundColor: Colors.black,
//               appBarTheme: const AppBarTheme(
//                   color: Colors.black,
//                   elevation: 0,
//                   titleTextStyle: TextStyle(
//                       color: Colors.white,
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold),
//                   iconTheme: IconThemeData(
//                     color: Colors.white,
//                   ),
//                   systemOverlayStyle: SystemUiOverlayStyle(
//                       statusBarColor: Colors.black,
//                       statusBarIconBrightness: Brightness.light)),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (BuildContext context) {
        if(MediaQuery.of(context).size.width.toInt() <= 560) {
          return MediaQuery(data: MediaQuery.of(context).copyWith(
            textScaleFactor: 0.8
          ), child: const Mobile());
        }
        return Desktop();
      },),
    );
  }

/*  @override
  // طريقه ال layoutBuilder
  Widget build(BuildContext context) {
    return MaterialApp(
        home: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if(constraints.minWidth.toInt() <= 560) {
          return Desktop();
        }
        return const Mobile();
      },));
  }*/
}


///علشان في صوره  بيكون فيها ايرور
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}