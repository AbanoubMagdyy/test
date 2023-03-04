import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:testing/moduels/news_app/web_view.dart';
import '../style/color.dart';

Widget itemArticle(Map articles,context) => InkWell(
  onTap:(){
    navigateTo(context,WebViewScreen(articles['url']));
  },
  child:   Stack(

        alignment: AlignmentDirectional.topStart,

        children: [

          ///first container

          Padding(

            padding: const EdgeInsets.symmetric(horizontal: 10),

            child: Container(

              width: double.infinity,

              height: 240,

              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(30),

                  color: Colors.white,

                  boxShadow: [BoxShadow(color: defaultColor, spreadRadius: 1)]),

            ),

          ),

          Column(

            mainAxisAlignment: MainAxisAlignment.end,

            children: [

              ///image

              Padding(

                padding: const EdgeInsets.symmetric(horizontal: 10),

                child: Container(

                  width: double.infinity,

                  height: 140,

                  decoration: BoxDecoration(

                      borderRadius:  const BorderRadius.only(

                        topLeft: Radius.circular(30),

                        topRight: Radius.circular(30),

                      ),

                      image: DecorationImage(

                          image:NetworkImage('${articles['urlToImage'] ??= "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"}') ,

                          fit: BoxFit.fill

                      )),

                ),

              ),

              Padding(

                padding: const EdgeInsets.only(top: 1, left: 30, right: 30),

                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [

                    Expanded(

                        child: Text(

                      '${articles['title']}',

                      maxLines: 3,

                      textAlign: TextAlign.center,

                      style: const TextStyle(

                          fontWeight: FontWeight.bold, fontSize: 15),

                      overflow: TextOverflow.ellipsis,

                    )),

                  ],

                ),

              ),

              Text(

                '${articles['publishedAt']}',

                style: TextStyle(color: defaultColor,fontSize: 15),

              ),

            ],

          ),

        ],

      ),
);

Widget newsArticle(List list)=>Padding(
    padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
    child: ListView.separated(
        physics:const BouncingScrollPhysics() ,
        itemBuilder: (context, index) => itemArticle(list[index],context),
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        itemCount: list.length)
);

void navigateTo(context,Widget screen)=>Navigator.push(context, MaterialPageRoute(builder:(context)=> screen));

void navigateAndFinish(context,Widget screen)=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=>screen ), (route) => false);

Widget defTextField({
  required TextEditingController controller,
  required String validate,
   String? labelText,
   String? hintText,
  Color borderColor = Colors.black,
  Color textColor = Colors.black,
  Color? suffixColor,
  bool enabled = true,
  required TextInputType keyboard,
  double borderRadius =20,
  IconData? suffixIcon,
  Function(String)? onFieldSubmitted,
})=> TextFormField(
  controller: controller,
  validator: (String? value) {
    if (value!.isEmpty) {
      return validate;
    }
    return null;
  },
  keyboardType: keyboard,
  style: TextStyle(
    color: textColor
  ),
  decoration: InputDecoration(
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
              color: borderColor,
              width: 2
          )
      ),
    enabledBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(
          color: borderColor,
            width: 2
      )
    ),
    enabled:enabled ,
    hintText: hintText,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      labelText: labelText,
      suffixIcon: Icon(suffixIcon,color:suffixColor ,)
  ),
  onFieldSubmitted: onFieldSubmitted,
);

Widget defButton({
  Color color = Colors.red,
  Color textColor = Colors.white,
  double radius=15,
  double width=double.infinity,
  required String text,
  required Function() onPressed,
})=> Container(
  width: width,
  decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius)
  ),
  child:  MaterialButton(
    onPressed: onPressed,
    child:  Text(text,
      style: TextStyle(
        color: textColor,
      ),
    ),
  ),
);


Widget fallBack()=>Center(
  child: SimpleCircularProgressBar(
    startAngle: 45,
    size: 80,
    backColor: defShopColor,
    progressColors: const [
      Colors.white,
      Colors.redAccent,
    ],
  ),
);