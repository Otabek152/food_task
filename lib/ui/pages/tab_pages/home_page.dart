import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_task/domain/hive/hive_add.dart';
import 'package:food_task/domain/hive/hive_box.dart';
import 'package:food_task/ui/pages/food_information_page/food_information_page.dart';
import 'package:food_task/ui/pages/search_page/search_page.dart';
import 'package:food_task/ui/resources/app_icon.dart';
import 'package:food_task/ui/theme/app_colors.dart';
import 'package:food_task/ui/theme/app_style.dart';
import 'package:hive_flutter/adapters.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
              margin: const EdgeInsets.only(top: 18),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const SearchPage(),
                        ));
                  },
                  icon: const Icon(Icons.search)))
        ],
      ),
      body: HomePageBody(),
    );
  }
}

class HomePageBody extends StatelessWidget {
  HomePageBody({super.key, this.search = ''});
  String search;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ValueListenableBuilder(
        valueListenable: HiveBox.foods.listenable(),
        builder: (context, Box<HiveAdd> foods, _) {
          final _allfoods = foods.values.toList();
          List<HiveAdd> list = [];
          list = _allfoods
              .where(
                  (element) => element.foodName.toLowerCase().contains(search))
              .toList();
              if(list.isEmpty){
                return Center(child: Text('No posts yet' , style: AppStyle.fontHeader,),);
              }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height),
              mainAxisSpacing: 32,
              crossAxisSpacing: 25,
            ),
            itemBuilder: (context, index) {
              Uint8List image8list = Uint8List.fromList(
                  _allfoods[index].foodImage == null
                      ? []
                      : _allfoods[index].foodImage!);
              return GestureDetector(
                onTap: (() {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => FoodInformationPage(
                          index: index,
                        ),
                      ));
                }),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.account_circle),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Name',
                          style: TextStyle(
                              color: AppColors.darkBlue, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        SizedBox(
                          height: 151.0,
                          width: MediaQuery.of(context).size.width / 2,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            child: Image.memory(
                              image8list,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        ClipRRect(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              margin: const EdgeInsets.all(16),
                              height: 32,
                              width: 32,
                              padding: const EdgeInsets.all(6),
                              child: SvgPicture.asset(AppIcon.heart1)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      '${list[index].foodName}',
                      style: AppStyle.fontHeader,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Food \u2981 ${(list[index].value)!.toStringAsFixed(0)} mins',
                      style: AppStyle.fontText,
                    ),
                  ],
                ),
              );
            },
            itemCount: list.length,
          );
        },
      ),
    );
  }
}
