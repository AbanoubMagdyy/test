import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/componoents/components.dart';
import 'package:testing/shared/news_bloc/cubit.dart';
import 'package:testing/shared/news_bloc/states.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
       listener: (context,state){},
       builder: (context,state){
         List list =NewsCubit.get(context).sports;
         return Scaffold(body: newsArticle(list));
       },
    );
  }
}