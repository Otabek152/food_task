import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_task/domain/hive/hive_box.dart';
import 'package:food_task/ui/resources/app_icon.dart';
import 'package:food_task/ui/theme/app_style.dart';

class FoodInformationPage extends StatelessWidget {
  FoodInformationPage({super.key, required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FoodInformationPageBody(
        index: index,
      ),
    );
  }
}

class FoodInformationPageBody extends StatelessWidget {
  FoodInformationPageBody({super.key, required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    final _foods = HiveBox.foods.values.toList();
    Uint8List image8list = Uint8List.fromList(_foods[index].foodImage!);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            bottom: const PreferredSize(
              preferredSize: Size(0, 20),
              child: SizedBox(),
            ),
            pinned: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image(
                    fit: BoxFit.cover,
                    image: Image.memory(image8list).image,
                  ),
                ),
                Positioned(
                  bottom: -1,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.only(left: 168,right: 168),
                      child:  Divider(
                        color: Colors.grey,
                        height: 5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    '${_foods[index].foodName}',
                    style: AppStyle.fontHeader,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Food \u2981 ${(_foods[index].value)!.toStringAsFixed(0)}  mins',
                    style: AppStyle.fontText.copyWith(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.account_box_outlined,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Elena Shelby',
                              style: AppStyle.fontHeader.copyWith(fontSize: 15),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppIcon.heart,
                              color: Colors.green,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Likes',
                              style: AppStyle.fontHeader.copyWith(fontSize: 15),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    '${_foods[index].foodDescription}',
                    style: AppStyle.fontText.copyWith(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Ingredients',
                    style: AppStyle.fontHeader,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
