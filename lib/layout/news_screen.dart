import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:testing/moduels/news_app/search_screen.dart';
import 'package:testing/shared/news_bloc/cubit.dart';
import 'package:testing/shared/news_bloc/states.dart';
import 'package:testing/style/color.dart';
import '../componoents/components.dart';
import '../moduels/news_app/menu_screen.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
       List allNews = cubit.allNews ;
        return Scaffold(
          appBar: AppBar(
            title: const Text('subject'),
            actions: [
              IconButton(onPressed: () {
                navigateTo(context, const SearchScreen());
              }, icon:  Icon(Icons.search,color: defaultColor)),
              IconButton(
                  onPressed: () {
                    cubit.changeThemeMode();
                  },
                  icon:  Icon(cubit.iconTheme,color: defaultColor,)
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuScreen()));
                  },
                  icon:  Icon(Iconsax.menu,color: defaultColor)),
            ],
          ),
          body: newsArticle(allNews) ,
        );
      },
    );
  }
}
